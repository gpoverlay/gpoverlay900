# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.5

EAPI=8

CRATES="
"

declare -A GIT_CRATES=(
	[lsp-types]='https://github.com/astral-sh/lsp-types;3512a9f33eadc5402cfab1b8f7340824c8ca1439;lsp-types-%commit%'
	[salsa-macro-rules]='https://github.com/salsa-rs/salsa;99be5d9917c3dd88e19735a82ef6bf39ba84bd7e;salsa-%commit%/components/salsa-macro-rules'
	[salsa-macros]='https://github.com/salsa-rs/salsa;99be5d9917c3dd88e19735a82ef6bf39ba84bd7e;salsa-%commit%/components/salsa-macros'
	[salsa]='https://github.com/salsa-rs/salsa;99be5d9917c3dd88e19735a82ef6bf39ba84bd7e;salsa-%commit%'
)

RUST_MIN_VER="1.83.0"

inherit shell-completion cargo

DESCRIPTION="An extremely fast Python linter, written in Rust"
HOMEPAGE="
	https://docs.astral.sh/ruff/
	https://github.com/astral-sh/ruff
"
SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/astral-sh/ruff/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
"
SRC_URI+=" https://github.com/gentoo-crate-dist/${PN}/releases/download/${PV}/${P}-crates.tar.xz"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 PSF-2 Unicode-3.0
	Unicode-DFS-2016 WTFPL-2 ZLIB
"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~loong ~riscv"

RDEPEND="
	!elibc_musl? ( !elibc_Darwin? ( !elibc_bionic? ( dev-libs/jemalloc:= ) ) )
	app-arch/zstd
"
DEPEND="
	${RDEPEND}
"

QA_FLAGS_IGNORED="usr/bin/.*"

DOCS=(
	BREAKING_CHANGES.md
	CODE_OF_CONDUCT.md
	CONTRIBUTING.md
	README.md
	assets
	docs
)

src_prepare() {
	default

	# Experimental cruft cleaner. These crates are not used by the ruff binary,
	# and when they are removed in the git repo, the lockfile is regenerated
	# and gets quite a bit smaller. Hence pycargoebuild also produces much
	# smaller CRATES= variables. Less for the user to download, fewer distfiles
	# to mirror.
	pushd crates >/dev/null || die
	rm -r ruff_{benchmark,dev} red_knot{,_server} *_wasm || die
	popd > /dev/null || die

	# tests that hang in the ebuild environment
	rm crates/ruff_annotate_snippets/tests/examples.rs || die
}

src_configure() {
	export RUSTFLAGS="${RUSTFLAGS}"
	cargo_src_configure
}

src_compile() {
	local -x ZSTD_SYS_USE_PKG_CONFIG=1
	# Gentoo bug #927338
	if use !elibc_musl && use !elibc_Darwin && use !elibc_bionic; then
		local -x CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
		local -x JEMALLOC_OVERRIDE="${ESYSROOT}/usr/$(get_libdir)"/libjemalloc.so
	fi
	cargo_src_compile --bin ruff

	local releasedir
	releasedir=$(cargo_target_dir)

	${releasedir}/ruff generate-shell-completion bash > ruff-completion.bash || die
	${releasedir}/ruff generate-shell-completion zsh > ruff-completion.zsh || die
}

src_test() {
	local -x ZSTD_SYS_USE_PKG_CONFIG=1
	# Gentoo bug #927338
	if use !elibc_musl && use !elibc_Darwin && use !elibc_bionic; then
		local -x CARGO_FEATURE_UNPREFIXED_MALLOC_ON_SUPPORTED_PLATFORMS=1
		local -x JEMALLOC_OVERRIDE="${ESYSROOT}/usr/$(get_libdir)"/libjemalloc.so
	fi
	cargo_src_test --target-dir "${PWD}"/tested-target/
}

src_install() {
	local releasedir=$(cargo_target_dir)

	dobin ${releasedir}/ruff

	newbashcomp ruff-completion.bash ruff
	newzshcomp ruff-completion.zsh _ruff

	dodoc -r "${DOCS[@]}"
}
