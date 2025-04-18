# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="
	ahash@0.8.11
	aho-corasick@1.1.2
	aliasable@0.1.3
	anstream@0.6.12
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.80
	assert_cmd@2.0.14
	autocfg@1.3.0
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.4.2
	bstr@1.9.0
	cfg-if@1.0.0
	clap@4.5.1
	clap_builder@4.5.1
	clap_complete@4.5.1
	clap_complete_fig@4.5.0
	clap_derive@4.5.0
	clap_lex@0.7.0
	color-print-proc-macro@0.3.5
	color-print@0.3.5
	colorchoice@1.0.0
	difflib@0.4.0
	dirs-sys@0.4.1
	dirs@5.0.1
	doc-comment@0.3.3
	dunce@1.0.4
	either@1.10.0
	errno@0.3.8
	fastrand@2.0.1
	getrandom@0.2.12
	glob@0.3.1
	hashbrown@0.14.5
	heck@0.4.1
	itoa@1.0.11
	home@0.5.9
	itertools@0.12.1
	libc@0.2.154
	libredox@0.0.1
	linux-raw-sys@0.4.13
	lock_api@0.4.12
	memchr@2.7.1
	mime@0.3.17
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	nix@0.27.1
	nom@7.1.3
	once_cell@1.19.0
	once_map@0.4.19
	option-ext@0.2.0
	ouroboros@0.18.3
	ouroboros_macro@0.18.3
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	ppv-lite86@0.2.17
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@3.1.0
	proc-macro2-diagnostics@0.10.1
	proc-macro2@1.0.78
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	redox_syscall@0.5.3
	redox_users@0.4.4
	regex-automata@0.4.5
	regex-syntax@0.8.2
	regex@1.10.3
	relative-path@1.9.2
	rinja@0.3.2
	rinja_derive@0.3.2
	rinja_parser@0.3.2
	rstest@0.18.2
	rstest_macros@0.18.2
	rstest_reuse@0.6.0
	rustc-hash@2.0.0
	rustc_version@0.4.0
	rustix@0.38.31
	scopeguard@1.2.0
	semver@1.0.22
	serde@1.0.197
	serde_derive@1.0.197
	smallvec@1.13.2
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.11.0
	syn@1.0.109
	syn@2.0.50
	tempfile@3.10.0
	termtree@0.4.1
	thiserror-impl@1.0.57
	thiserror@1.0.57
	unicase@2.7.0
	unicode-ident@1.0.12
	utf8parse@0.2.1
	version_check@0.9.4
	wait-timeout@0.2.0
	wasi@0.11.0+wasi-snapshot-preview1
	which@6.0.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	yansi@1.0.0-rc.1
	zerocopy@0.7.35
	zerocopy-derive@0.7.35
"

inherit cargo shell-completion

DESCRIPTION="A smarter cd command for your terminal"
HOMEPAGE="https://github.com/ajeetdsouza/zoxide"
SRC_URI="
	https://github.com/ajeetdsouza/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	MIT MPL-2.0 Unicode-DFS-2016
	|| ( Apache-2.0 CC0-1.0 MIT-0 )
"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

QA_FLAGS_IGNORED="usr/bin/zoxide"

src_prepare() {
	sed -i 's:strip = true:strip = false:g' Cargo.toml || die
	default
}

src_install() {
	cargo_src_install

	doman man/man1/*
	dodoc README.md CHANGELOG.md

	newbashcomp contrib/completions/"${PN}".bash "${PN}"
	dozshcomp contrib/completions/_"${PN}"
	dofishcomp contrib/completions/"${PN}".fish

	insinto /usr/share/"${PN}"
	doins init.fish
	doins zoxide.plugin.zsh
}
