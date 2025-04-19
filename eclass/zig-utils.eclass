# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: zig-utils.eclass
# @MAINTAINER:
# Eric Joldasov <bratishkaerik@landless-city.net>
# @AUTHOR:
# Eric Joldasov <bratishkaerik@landless-city.net>
# @SUPPORTED_EAPIS: 8
# @BLURB: Prepare Zig toolchain and set global variables
# @DESCRIPTION:
# Prepare Zig toolchain and set global variables.
# Supports Zig 0.13+.
# Does not set any default function, ebuilds must call them manually.
# Generally, only "zig-utils_setup" is needed.
#
# Intended to be used by ebuilds that call "zig build-exe/lib/obj"
# or "zig test" directly and by "dev-lang/zig".
# For ebuilds with ZBS (Zig Build System), it's usually better
# to inherit zig.eclass instead, as it has default phases-functions.

if [[ -z ${_ZIG_UTILS_ECLASS} ]]; then
_ZIG_UTILS_ECLASS=1

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

inherit edo flag-o-matic linux-info

# @ECLASS_VARIABLE: ZIG_SLOT
# @PRE_INHERIT
# @REQUIRED
# @DESCRIPTION:
# Zig slot that will be used in "ezig" function.  Also, if
# ZIG_OPTIONAL is empty, adds dev-lang/zig and dev-lang/zig-bin
# dependency to BDEPEND.  Must be >= "0.13".
#
# Example:
# @CODE
# ZIG_SLOT="0.13"
# @CODE
#
# When a new Zig release occurs, it is advisable for maintainers to
# check whether their ebuild supports that new version.  If yes, they
# they should bump ZIG_SLOT to the latest version; if not supported,
# they need to patch any issues with new version and again bump
# ZIG_SLOT.  This helps to reduce dependencies on outdated Zig
# versions.
#
# This policy of "1 exclusive Zig slot" will work until it
# stabilizes enough (probably near 1.0), then it will be re-evaluated
# and most likely changed to more common in other eclasses ZIG_MIN/
# ZIG_MAX form.

# @ECLASS_VARIABLE: ZIG_NEEDS_LLVM
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# If set to a non-empty value, the package will BDEPEND on a Zig package
# with LLVM enabled.  This is currently required for packages that require
# C/C++ source files to be compiled with Zig.

# @ECLASS_VARIABLE: ZIG_OPTIONAL
# @PRE_INHERIT
# @DEFAULT_UNSET
# @DESCRIPTION:
# If set to a non-empty value, all logic in zig-utils and
# zig eclasses will be considered optional.  No dependencies
# will be added and no phase functions will be exported.
#
# For zig-utils.eclass users:
# You have to add Zig dependency in your BDEPEND manually and call
# at least "zig-utils_setup" before using "ezig".
#
# For zig.eclass users: see documentation in zig.eclass
# instead.
if [[ ! ${ZIG_OPTIONAL} ]]; then
	_ZIG_USEDEP=""
	if [[ ${ZIG_NEEDS_LLVM} ]]; then
		_ZIG_USEDEP="[llvm(+)]"
	fi

	# NOTE: zig-bin is always built with LLVM support, so no USE needed.
	BDEPEND="
		|| (
			dev-lang/zig:${ZIG_SLOT}${_ZIG_USEDEP}
			dev-lang/zig-bin:${ZIG_SLOT}
		)
	"
fi

# @ECLASS_VARIABLE: ZIG_TARGET
# @DEFAULT_UNSET
# @DESCRIPTION:
# Zig target tuple to use.  Has the following format:
# arch-os[.os_version_range]-abi[.abi_version]
# Can be passed as:
# * "-target " option in "zig test" or "zig build-exe/lib/obj",
# * "-Dtarget=" option in "zig build"
#   (if project uses "std.Build.standardTargetOptions").
#
# Can be set by user in make.conf.  If not set, then auto-generated by
# "zig-utils_setup".
#
# Example:
# @CODE
# # Autodetected by Zig:
# ZIG_TARGET="native"
# # Machine running Linux x86_64 system, with glibc:
# ZIG_TARGET="x86_64-linux-gnu"
# # Similar to above, but versions are passed explicitly:
# ZIG_TARGET="x86_64-linux.6.1.12...6.6.16-gnu.2.38"
# # Machine running Linux PPC64 little-endian system, with musl
# ZIG_TARGET="powerpc64le-linux-musl"
# @CODE
#
# Note for eclass users: it is discouraged to overwrite ZIG_TARGET
# value by ebuilds.  In most cases, if you need to hardcode value for
# -Dtarget, it's better to change "build.zig" code instead to use
# appropriate values.  For example, if some build-time executable
# intented for host is compiled for cross-platform target, change in
# build.zig "target" for that executable to be "b.graph.host".
#
# In rare cases, if you really need to hardcode ZIG_TARGET, use this
# syntax before calling `zig-utils_setup` (or `zig_pkg_setup`) to
# allow user override:
# @CODE
# pkg_setup() {
# 	: "${ZIG_TARGET:=aarch64-freestanding-none}"
# 	zig_pkg_setup
# }
# @CODE

# @ECLASS_VARIABLE: ZIG_CPU
# @DEFAULT_UNSET
# @DESCRIPTION:
# Zig target CPU and features to use.  Has the following format:
# family_name(\+enable_feature|\-disable_feature)*
# Can be passed as:
# * "-mcpu " option in "zig test" or "zig build-exe/lib/obj",
# * "-Dcpu=" option in "zig build"
#   (if project uses "std.Build.standardTargetOptions").
#
# Can be set by user in make.conf.  If not set, then auto-generated by
# "zig-utils_setup".
#
# Example:
# @CODE
# # Autodetected by Zig:
# ZIG_CPU="native"
# # AMD Zen 2 processor
# ZIG_CPU="znver2"
# # x86_64 processor, X87 support enabled, SSE2 support disabled
# ZIG_CPU="x86_64+x87-sse2"
# @CODE
#
# Note for eclass users: it is discouraged to overwrite ZIG_CPU
# value by ebuilds.  In most cases, if you need to hardcode value for
# -Dcpu, it's better to change "build.zig" code instead to use
# appropriate values.  For example, if some build-time executable
# intented for host is compiled for cross-platform target, change in
# build.zig "target" for that executable to be "b.graph.host".
#
# In rare cases, if you really need to hardcode ZIG_CPU, use this
# syntax before calling `zig-utils_setup` (or `zig_pkg_setup`) to
# allow user override:
# @CODE
# pkg_setup() {
# 	: "${ZIG_CPU:=apple_m1}"
# 	zig_pkg_setup
# }
# @CODE

# @ECLASS_VARIABLE: ZIG_EXE
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# Absolute path to the used Zig executable.
# Set by "zig-utils_setup"/"zig-utils_find_installation".
#
# Please note that when passing one flag several times with different
# values:
# * (only "zig build") in "-Dbar=false -Dbar" form:
#   errors due to conflict of flags,
# * (only "zig build") in "-Dbar=false -Dbar=true" form:
#   "bar" becomes a list, which is likely not what you want,
# * in "-fbar -fno-bar" form:
#   latest value overwrites values before.
# Example above shows only boolean option, but it is same with other
# types of options (enums, "std.zig.BuildId", "std.SemanticVersion",
# integers, strings, etc.).

# @ECLASS_VARIABLE: ZIG_VER
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# Zig version as reported in dev-lang/zig-${PV} PV part.
# Set by "zig-utils_setup"/"zig-utils_find_installation".
#
# Example:
# @CODE
# 0.13.0
# @CODE

# @FUNCTION: _get-c-option
# @INTERNAL
# @USAGE: <option-name>
# @DESCRIPTION:
# Gets value of some compiler option from CFLAGS, starting from the end.
# Must be a full name, without "-" and "=..." part.
#
# Example:
# @CODE
# CFLAGS="-march=i686 -march=i586"
# _get-c-option march # returns i586
# @CODE
_get-c-option() {
	if [[ ${#} -ne 1 ]]; then
		die "${FUNCNAME[0]}: expected 1 argument, got ${#}"
	fi

	local prefix="-${1}="
	local c_flags=( ${CFLAGS} )
	for (( i=${#c_flags[@]} - 1; i >= 0; i -= 1 )); do
		local c_flag="${c_flags[i]}"
		if [[ "${c_flag}" == ${prefix}* ]]; then
			echo "${c_flag#${prefix}}"
			return
	    fi
	done
	echo ""
}

# @FUNCTION: zig-utils_c_env_to_zig_target
# @USAGE: <C-style target tuple> <CFLAGS>
# @DESCRIPTION:
# Translates C-style target tuple (like CHOST) and CFLAGS to Zig-style
# target tuple.  For full information "zig-utils_c_env_to_zig_cpu" is
# needed, because some information is located in different places in C
# and Zig, for example:
# * Moved from C target to Zig CPU: x86 and ARM families,
# * Moved from CFLAGS to Zig tuple: ARM Thumb mode.
#
# Mostly used during cross-compilation to get target triple if user
# did not set ZIG_TARGET variable, and always during bootstraping Zig.
#
# See ZIG_TARGET description for more information.
zig-utils_c_env_to_zig_target() {
	if [[ ${#} -ne 2 ]]; then
		die "${FUNCNAME[0]}: expected 2 arguments, got ${#}"
	fi
	local c_tuple="${1}"
	local c_arch="${c_tuple%%-*}"
	local c_abi="${c_tuple##*-}"

	local -x CFLAGS="${2}"
	local c_flags_march="$(_get-c-option march)"

	local arch os abi

	case "${c_arch}" in
		i?86) arch=x86;;
		arm64) arch=aarch64;;
		arm*)
			if [[ "${c_flags_march}" == *-m ]]; then
				arch=thumb
			else
				arch=arm
			fi

			if [[ "${c_arch}" == *eb ]]; then
				arch+="eb"
			fi
			;;
		*) arch="${c_arch}";;
	esac

	case "${c_tuple}" in
		*-linux*) os=linux;;
		*-apple*) os=macos;;
	esac

	case "${c_abi}" in
		darwin*) abi=none;;
		*) abi="${c_abi}";;
	esac

	echo "${arch}-${os}-${abi}"
}

# @FUNCTION: zig-utils_c_env_to_zig_cpu
# @USAGE: <C-style target tuple> <CFLAGS>
# @DESCRIPTION:
# Translates C-style target tuple (like CHOST) and CFLAGS to Zig-style
# target CPU and features.  For full information
# "zig-utils_c_env_to_zig_target" is needed, because some information
# is located in different places in C and Zig, for example:
# * Moved from C target to Zig CPU: x86 and ARM families,
# * Moved from CFLAGS to Zig tuple: ARM Thumb mode.
#
# Used to get target CPU if user did not set ZIG_CPU variable.
#
# See ZIG_CPU description for more information.
zig-utils_c_env_to_zig_cpu() {
	if [[ ${#} -ne 2 ]]; then
		die "${FUNCNAME[0]}: expected 2 arguments, got ${#}"
	fi
	local c_tuple="${1}"
	local c_arch="${c_tuple%%-*}"

	local -x CFLAGS="${2}"
	local c_flags_mabi="$(_get-c-option mabi)"
	local c_flags_march="$(_get-c-option march)"
	local c_flags_mcpu="$(_get-c-option mcpu)"
	local c_flags_mfpu="$(_get-c-option mfpu)"
	local c_flags_mtune="$(_get-c-option mtune)"

	local base_cpu features=""

	case "${c_arch}" in
		x86_64 | i?86)
			local c_cpu="${c_flags_march}"
			case "${c_cpu}" in
				"") base_cpu="${c_arch}";;
				*) base_cpu="${c_cpu//[-.]/_}";;
			esac
			;;
		aarch64 | aarch64_be | arm*)
			local c_cpu="${c_flags_mcpu}"
			case "${c_cpu}" in
				"") base_cpu=generic;;
				*) base_cpu="${c_cpu//[-.]/_}";;
			esac

			case "${c_flags_march}" in
				"" | unset) ;;
				armv*)
					local c_arm_family="${c_flags_march##arm}"
					c_arm_family="${c_arm_family//./_}"
					c_arm_family="${c_arm_family//-/}"
					features+="+${c_arm_family}"
					;;
				native)
					# GCC docs: This option has no effect if
					# the compiler is unable to recognize the
					# architecture of the host system.
					#
					# When -march=native is given and no other
					# -mcpu or -mtune is given then ... -march=native
					# is treated as -mcpu=native.
					if [[ -z "${c_flags_mcpu}${c_flags_mtune}" ]]; then
						base_cpu=native
					else
						: # Zig can not detect CPU features (architecture
						# in our case) separately from model, so we ignore it.
					fi
					;;
				*) features+="+${c_flags_march}";;
			esac

			if [[ "${c_arch}" != aarch64* && "${c_arch}" != arm64 ]]; then
				if [[ "${c_flags_mfpu}" == crypto-* ]]; then
					c_flags_mfpu="${c_flags_mfpu##crypto-}"
					features+="+crypto"
				fi
				if [[ "${c_flags_mfpu}" == neon-* ]]; then
					c_flags_mfpu="${c_flags_mfpu##neon-}"
					features+="+neon"
				fi

				case "${c_flags_mfpu}" in
					"" | auto) ;;
					neon) features+="+neon";;
					fp16) features+="+fp16";;
					fp-armv8) features+="+fp_armv8";;

					vfp | vfpv2) features+="+vfp2";;

					vfp3 | vfpv3) features+="+vfp3";;
					vfpv3-fp16) features+="+vfp3sp";;
					vfpv3-d16) features+="+vfp3d16";;
					vfpv3-d16-fp16) features+="+vfp3d16sp";;
					vfpv3xd) features+="+vfp3d16sp";;
					vfpv3xd-fp16) features+="+vfp3d16sp+fp16";;

					vfpv4) features+="+vfp4";;
					vfpv4-fp16) features+="+vfp4sp";;
					vfpv4-d16) features+="+vfp4d16";;
					fpv4-sp-fp16) features+="+vfp4d16sp";;

					fpv5-d16) features+="+fp_armv8d16+fp64";;
					*) die -n "Unknown ARM FPU: ${c_flags_mfpu}";;
				esac

				local is_softfloat="$(CTARGET="${c_tuple}" tc-tuple-is-softfloat)"
				case "${is_softfloat}" in
					only | yes) features+="+soft_float";;
					softfp | no) features+="-soft_float";;
					*) die -n "tc-tuple-is-softfloat returned unexpected value: ${is_softfloat}"
				esac
			fi
			;;
		riscv32 | riscv64)
			local c_cpu="${c_flags_mcpu}"
			case "${c_cpu}" in
				"")
					case "${c_arch}" in
						riscv32) base_cpu=generic_rv32;;
						riscv64) base_cpu=generic_rv64;;
					esac
					;;
				*) base_cpu="${c_cpu//[-.]/_}";;
			esac

			local base_isa="${c_flags_march:0:4}"
			local extensions="${c_flags_march:4}"

			case "${base_isa}" in
				"" | rv32 | rv64) ;;
				*) die -n "Unknown RISC-V architecture: ${base_isa}";;
			esac

			local extension
			while read -n 1 extension; do
				case "${extension}" in
					"") ;;
					g) features+="+i+m+a+f+d+zicsr+zifencei";;
					_) die -n "Can't translate multi-letter RISC-V extensions yet";;
					*) features+="+${extension}";;
				esac
			done <<< "${extensions}"

			case "${c_flags_mabi}" in
				ilp32d | lp64d) features+="+d";;
				ilp32e | lp64e) features+="+e";;
				ilp32f | lp64f) features+="+f";;
				"" | ilp32 | lp64) ;;
				*) die -n "Unknown RISC-V ABI: ${c_flags_mabi}";;
			esac
			;;
		loongarch64)
			local c_cpu="${c_flags_march}"
			case "${c_cpu}" in
				"") base_cpu=generic_la64;;
				*) base_cpu="${c_cpu//[-.]/_}";;
			esac

			case "${c_flags_mabi}" in
				lp64d) features+="+d";;
				lp64f) features+="+f";;
				lp64s | "") ;;
				*) die -n "Unknown LoongArch ABI: ${c_flags_mabi}";;
			esac
			;;
		powerpc | powerpcle | powerpc64 | powerpc64le)
			local c_cpu="${c_flags_mcpu}"
			case "${c_cpu}" in
				"")
					case "${c_arch}" in
						powerpc | powerpcle) base_cpu=ppc;;
						powerpc64 | powerpc64le) base_cpu=ppc64;;
					esac
					;;
				G*) base_cpu="${c_cpu//G/g}";;
				powerpcle) base_cpu=ppc;;
				powerpc*) base_cpu="${c_cpu//powerpc/ppc}";;
				power*) base_cpu="${c_cpu//power/pwr}";;
				*) base_cpu="${c_cpu//[-.]/_}";;
			esac
			;;
		*) base_cpu=generic;;
	esac

	echo "${base_cpu}${features}"
}

# @FUNCTION: zig-utils_find_installation
# @DESCRIPTION:
# Detects suitable Zig installation and sets ZIG_VER and ZIG_EXE
# variables.
#
# See ZIG_EXE and ZIG_VER descriptions for more information.
zig-utils_find_installation() {
	# Adapted from https://github.com/gentoo/gentoo/pull/28986
	# Many thanks to Florian Schmaus (Flowdalic)!

	[[ -n "${ZIG_SLOT}" ]] || die "${FUNCNAME[0]}: ZIG_SLOT must be set"
	if ver_test "${ZIG_SLOT}" -lt "0.13"; then
		die "${ECLASS}: ZIG_SLOT must be >= 0.13, found ${ZIG_SLOT}"
	fi

	einfo "Searching Zig ${ZIG_SLOT}..."

	local zig_supported_versions=(
		"9999"
		"0.14.1"
		"0.14.0"
		"0.13.1"
		"0.13.0"
	)

	local base_path="${BROOT}/usr/bin"

	local -x ZIG_GLOBAL_CACHE_DIR="${T}/zig-detect"
	mkdir -p "${ZIG_GLOBAL_CACHE_DIR}" || die
	touch "${ZIG_GLOBAL_CACHE_DIR}/empty.zig" || die

	local selected_path selected_ver
	for selected_ver in "${zig_supported_versions[@]}"; do
		# Check if candidate satisfies ZIG_SLOT condition.
		if [[ "${selected_ver}" != "${ZIG_SLOT}"* ]]; then
			continue
		fi

		# Prefer "dev-lang/zig" over "dev-lang/zig-bin"
		local candidate_path
		for candidate_path in "${base_path}"/zig{,-bin}-"${selected_ver}"; do
			if [[ -x "${candidate_path}" ]]; then
				if [[ ${ZIG_NEEDS_LLVM} ]]; then
					"${candidate_path}" test -fllvm -OReleaseSmall "${ZIG_GLOBAL_CACHE_DIR}/empty.zig" &> /dev/null || continue
				fi
				selected_path="${candidate_path}"
				break 2
			fi
		done
	done

	if [[ -z "${selected_path}" ]]; then
		die "Could not find (suitable) Zig at \"${base_path}\""
	fi

	declare -g ZIG_EXE="${selected_path}"
	declare -g ZIG_VER="${selected_ver}"
	# Sanity check, comment from upstream:
	# > Check libc++ linkage to make sure Zig was built correctly,
	# > but only for "env" and "version" to avoid affecting the
	# > startup time for build-critical commands
	# > (check takes about ~10 μs)
	"${ZIG_EXE}" version > /dev/null ||
		die "Sanity check failed for \"${ZIG_EXE}\""
}

# @FUNCTION: zig-utils_setup
# @DESCRIPTION:
# Checks if running Linux kernel version is supported by Zig.
# Populates ZIG_TARGET, ZIG_CPU, ZIG_EXE and ZIG_VER global
# variables with detected values, or, if user set them already,
# leaves as-is.
zig-utils_setup() {
	# Should be first because it sets ZIG_VER which might be used
	# in the future when setting ZIG_TARGET and ZIG_CPU variables
	# for incompatible versions.
	if [[ -z "${ZIG_EXE}" ]]; then
		zig-utils_find_installation
	fi

	: "${ZIG_CPU:=$(zig-utils_c_env_to_zig_cpu "${CHOST}" "${CFLAGS}")}"
	if tc-is-cross-compiler; then
		: "${ZIG_TARGET:=$(zig-utils_c_env_to_zig_target "${CHOST}" "${CFLAGS}")}"
	else
		: "${ZIG_TARGET:=native}"
	fi
	declare -g ZIG_CPU ZIG_TARGET

	einfo "ZIG_EXE:    \"${ZIG_EXE}\""
	einfo "ZIG_VER:     ${ZIG_VER}"
	einfo "ZIG_TARGET:  ${ZIG_TARGET}"
	einfo "ZIG_CPU:     ${ZIG_CPU}"
}

# @FUNCTION: ezig
# @USAGE: [<args>...]
# @DESCRIPTION:
# Runs ZIG_EXE with supplied arguments.  Dies if ZIG_EXE is not set or
# if command exits with error.  Respects `nonfatal`.
#
# Always disables progress tree.  By default enables ANSI escape codes
# (colors, etc.), user can set NO_COLOR environment variable to
# disable them.
#
# Note that color support also determines how compile errors will be
# printed: source code lines and reference traces are not available
# when colors are disabled.
ezig() {
	# Sync description above and comments below with upstream's
	# "std.io.tty.detectConfig".
	debug-print-function "${FUNCNAME[0]}" "${@}"

	if [[ -z "${ZIG_EXE}" ]] ; then
		die "${FUNCNAME[0]}: ZIG_EXE is not set. Was 'zig-utils_setup' called before using ezig?"
	fi

	# Progress tree is helpful indicator in TTY, but unfortunately
	# they make Portage logs harder to read in plaintext.
	#
	# We don't have global toggle for all Zig commands to disable
	# progress tree, however we can emulate this using 2 steps.

	# Disable progress tree and colors. Errors are now less detailed.
	local -x TERM=dumb
	# Re-enable colors. Errors are now yet again detailed for reading.
	local -x CLICOLOR_FORCE=1
	# User's NO_COLOR has more priority and can disable colors again.
	"${ZIG_EXE}" "${@}" || die -n "Failed to run command: ${ZIG_EXE} ${@}"
}
fi
