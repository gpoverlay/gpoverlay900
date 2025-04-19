# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.2

EAPI=8

CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-width@0.1.0
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	arbitrary@1.4.1
	arrayref@0.3.9
	arrayvec@0.7.6
	autocfg@1.4.0
	bigdecimal@0.4.7
	binary-heap-plus@0.5.0
	bincode@1.3.3
	bindgen@0.70.1
	bitflags@1.3.2
	bitflags@2.7.0
	bitvec@1.0.1
	blake2b_simd@1.0.2
	blake3@1.5.5
	block-buffer@0.10.4
	bstr@1.11.3
	bumpalo@3.16.0
	bytecount@0.6.8
	byteorder@1.5.0
	cc@1.2.8
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono-tz-build@0.4.0
	chrono-tz@0.10.1
	chrono@0.4.39
	clang-sys@1.8.1
	clap@4.5.26
	clap_builder@4.5.26
	clap_complete@4.5.42
	clap_lex@0.7.4
	clap_mangen@0.2.26
	colorchoice@1.0.3
	compare@0.1.0
	console@0.15.10
	const-random-macro@0.1.16
	const-random@0.1.18
	constant_time_eq@0.3.1
	core-foundation-sys@0.8.7
	coz@0.1.3
	cpp@0.5.10
	cpp_build@0.5.10
	cpp_common@0.5.10
	cpp_macros@0.5.10
	cpufeatures@0.2.16
	crc32fast@1.4.2
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	ctrlc@3.4.5
	data-encoding-macro-internal@0.1.14
	data-encoding-macro@0.1.16
	data-encoding@2.7.0
	deranged@0.3.11
	derive_arbitrary@1.4.1
	diff@0.1.13
	digest@0.10.7
	displaydoc@0.2.5
	dlv-list@0.5.2
	dns-lookup@2.0.4
	dunce@1.0.5
	either@1.13.0
	encode_unicode@1.0.0
	equivalent@1.0.1
	errno@0.3.10
	exacl@0.12.0
	fastrand@2.3.0
	file_diff@1.0.0
	filedescriptor@0.8.2
	filetime@0.2.25
	flate2@1.0.35
	fnv@1.0.7
	foldhash@0.1.4
	fs_extra@1.3.0
	fsevent-sys@4.1.0
	fts-sys@0.2.13
	fundu-core@0.3.1
	fundu@2.0.1
	funty@2.0.0
	futures-core@0.3.31
	futures-macro@0.3.31
	futures-task@0.3.31
	futures-timer@3.0.3
	futures-util@0.3.31
	gcd@2.3.0
	generic-array@0.14.7
	getrandom@0.2.15
	glob@0.3.2
	half@2.4.1
	hashbrown@0.14.5
	hashbrown@0.15.2
	hermit-abi@0.3.9
	hex-literal@0.4.1
	hex@0.4.3
	hostname@0.4.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	indexmap@2.7.0
	indicatif@0.17.9
	inotify-sys@0.1.5
	inotify@0.11.0
	io-lifetimes@1.0.11
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.14
	js-sys@0.3.76
	keccak@0.1.5
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.5.0
	libc@0.2.169
	libloading@0.8.6
	libm@0.2.11
	libredox@0.1.3
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.15
	lock_api@0.4.12
	lockfree-object-pool@0.1.6
	log@0.4.22
	lru@0.12.5
	lscolors@0.20.0
	md-5@0.10.6
	memchr@2.7.4
	memmap2@0.9.5
	minimal-lexical@0.2.1
	miniz_oxide@0.8.2
	mio@1.0.3
	nix@0.29.0
	nom@7.1.3
	notify-types@2.0.0
	notify@8.0.0
	nu-ansi-term@0.50.1
	num-bigint@0.4.6
	num-conv@0.1.0
	num-integer@0.1.46
	num-modular@0.5.1
	num-prime@0.4.4
	num-traits@0.2.19
	num_threads@0.1.7
	number_prefix@0.4.0
	once_cell@1.20.2
	onig@6.4.0
	onig_sys@69.8.1
	ordered-multimap@0.7.3
	os_display@0.1.3
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	parse-zoneinfo@0.3.1
	parse_datetime@0.6.0
	phf@0.11.3
	phf_codegen@0.11.3
	phf_generator@0.11.3
	phf_shared@0.11.3
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkg-config@0.3.31
	platform-info@2.0.5
	portable-atomic@1.10.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	pretty_assertions@1.4.1
	prettyplease@0.2.27
	proc-macro-crate@3.2.0
	proc-macro2@1.0.93
	procfs-core@0.17.0
	procfs@0.17.0
	quick-error@2.0.1
	quote@1.0.38
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_pcg@0.3.1
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.8
	reference-counted-singleton@0.1.5
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	relative-path@1.9.3
	rlimit@0.10.2
	roff@0.2.2
	rstest@0.24.0
	rstest_macros@0.24.0
	rust-ini@0.21.1
	rustc-hash@1.1.0
	rustc_version@0.4.1
	rustix@0.37.28
	rustix@0.38.43
	same-file@1.0.6
	scopeguard@1.2.0
	self_cell@1.1.0
	selinux-sys@0.6.13
	selinux@0.4.6
	semver@1.0.24
	serde-big-array@0.5.1
	serde@1.0.217
	serde_derive@1.0.217
	sha1@0.10.6
	sha2@0.10.8
	sha3@0.10.8
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simd-adler32@0.3.7
	siphasher@1.0.1
	slab@0.4.9
	sm3@0.4.2
	smallvec@1.13.2
	smawk@0.3.2
	socket2@0.5.8
	strsim@0.11.1
	syn@2.0.96
	tap@1.0.1
	tempfile@3.15.0
	terminal_size@0.2.6
	terminal_size@0.4.1
	textwrap@0.16.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tiny-keccak@2.0.2
	toml_datetime@0.6.8
	toml_edit@0.22.22
	trim-in-place@0.1.7
	typenum@1.17.0
	unicode-ident@1.0.14
	unicode-linebreak@0.1.5
	unicode-segmentation@1.12.0
	unicode-width@0.1.14
	unicode-width@0.2.0
	unicode-xid@0.2.6
	unindent@0.2.3
	utf8parse@0.2.2
	utmp-classic-raw@0.1.3
	utmp-classic@0.1.6
	uuid@1.11.1
	uutils_term_grid@0.6.0
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-shared@0.2.99
	wasm-bindgen@0.2.99
	web-time@1.1.0
	wild@2.2.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.24
	wyz@0.5.1
	xattr@1.4.0
	yansi@1.0.1
	z85@3.0.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zip@2.2.2
	zopfli@0.8.1
"

inherit cargo flag-o-matic multiprocessing

DESCRIPTION="GNU coreutils rewritten in Rust"
HOMEPAGE="https://uutils.github.io/coreutils/ https://github.com/uutils/coreutils"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/uutils/coreutils"
	inherit git-r3
elif [[ ${PV} == *_p* ]] ; then
	COREUTILS_COMMIT=""
	SRC_URI="https://github.com/uutils/coreutils/archive/${FINDUTILS_COMMIT}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" ${CARGO_CRATE_URIS}"
	S="${WORKDIR}"/coreutils-${COREUTILS_COMMIT}
else
	SRC_URI="https://github.com/uutils/coreutils/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" ${CARGO_CRATE_URIS}"
	S="${WORKDIR}"/coreutils-${PV}

	KEYWORDS="~amd64 ~arm64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD Boost-1.0 CC0-1.0 ISC MIT Unicode-3.0 ZLIB
"
SLOT="0"
IUSE="debug selinux test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/oniguruma:=
	selinux? ( sys-libs/libselinux )
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? ( dev-util/cargo-nextest )
"

QA_FLAGS_IGNORED=".*"

PATCHES=(
	"${FILESDIR}"/${PN}-0.2.27-xfail-tests.patch
	"${FILESDIR}"/${PN}-0.0.28-cow-tests.patch
)

src_unpack() {
	if [[ ${PV} == 9999 ]] ; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	# normally cargo_src_compile sets this for us, but we don't use it
	filter-lto

	# By default, the crate uses a system version if it can. This just guarantees
	# that it will error out instead of building a vendored copy.
	export RUSTONIG_SYSTEM_LIBONIG=1

	makeargs=(
		# Disable output synchronisation as make calls cargo
		-Onone

		V=1

		PROFILE=$(usex debug debug release)

		PREFIX="${EPREFIX}/usr"
		PROG_PREFIX="uu-"
		MULTICALL=y
		MANDIR="/share/man/man1"

		SELINUX_ENABLED=$(usex selinux)

		# pinky, uptime, users, and who require utmpx (not available on musl)
		# bug #832868
		SKIP_UTILS="$(usev elibc_musl "pinky uptime users who")"
	)

	emake "${makeargs[@]}"
}

src_test() {
	local -x RUST_BACKTRACE=full
	local -x NEXTEST_TEST_THREADS="$(makeopts_jobs)"

	# Nicer output for nextest vs test
	emake "${makeargs[@]}" \
		CARGOFLAGS="${CARGOFLAGS} $(usev !debug --release)" \
		TEST_NO_FAIL_FAST="--no-fail-fast" \
		nextest
}

src_install() {
	emake "${makeargs[@]}" DESTDIR="${D}" install
}
