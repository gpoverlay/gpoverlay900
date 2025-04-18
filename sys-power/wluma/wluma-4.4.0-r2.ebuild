# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.3
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.81
	ash@0.37.3+1.3.251
	atty@0.2.14
	autocfg@1.2.0
	backtrace@0.3.71
	bindgen@0.65.1
	bitflags@1.3.2
	bitflags@2.5.0
	bumpalo@3.15.4
	byteorder@1.5.0
	cc@1.0.90
	cexpr@0.6.0
	cfg-if@1.0.0
	chrono@0.4.37
	clang-sys@1.7.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.1
	dbus@0.9.7
	ddc-hi@0.4.1
	ddc-i2c@0.2.2
	ddc-macos@0.2.1
	ddc-winapi@0.2.1
	ddc@0.2.2
	difflib@0.4.0
	dlib@0.5.2
	downcast-rs@1.2.0
	downcast@0.11.0
	dtoa@0.4.8
	edid@0.3.0
	either@1.10.0
	env_logger@0.9.3
	equivalent@1.0.1
	errno@0.3.8
	float-cmp@0.9.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	fragile@2.0.0
	futures-core@0.3.30
	gimli@0.28.1
	glob@0.3.1
	hashbrown@0.14.3
	hermit-abi@0.1.19
	home@0.5.9
	humantime@2.1.0
	i2c-linux-sys@0.2.1
	i2c-linux@0.1.2
	i2c@0.1.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	indexmap@2.2.6
	inotify-sys@0.1.5
	inotify@0.10.2
	io-kit-sys@0.4.1
	itertools@0.10.5
	itoa@1.0.11
	js-sys@0.3.69
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.153
	libdbus-sys@0.2.5
	libloading@0.8.3
	libudev-sys@0.1.4
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	log@0.4.21
	mach2@0.4.2
	mach@0.3.2
	mccs-caps@0.1.3
	mccs-db@0.1.3
	mccs@0.1.3
	memchr@1.0.2
	memchr@2.7.2
	memoffset@0.6.5
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.11
	mockall@0.11.4
	mockall_derive@0.11.4
	nix@0.24.3
	nom@3.2.1
	nom@7.1.3
	normalize-line-endings@0.3.0
	num-traits@0.2.18
	nvapi-sys@0.1.3
	nvapi@0.1.4
	object@0.32.2
	once_cell@1.19.0
	peeking_take_while@0.1.2
	pin-project-lite@0.2.14
	pkg-config@0.3.30
	predicates-core@1.0.6
	predicates-tree@1.0.9
	predicates@2.1.5
	prettyplease@0.2.17
	proc-macro2@1.0.79
	quote@1.0.35
	regex-automata@0.4.6
	regex-syntax@0.8.3
	regex@1.10.4
	resize-slice@0.1.3
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.38.32
	ryu@1.0.17
	scoped-tls@1.0.1
	serde@1.0.197
	serde_derive@1.0.197
	serde_spanned@0.6.5
	serde_yaml@0.7.5
	serde_yaml@0.9.34+deprecated
	shlex@1.3.0
	smallvec@1.13.2
	socket2@0.5.6
	syn@1.0.109
	syn@2.0.57
	termcolor@1.4.1
	termtree@0.4.1
	thiserror-impl@1.0.58
	thiserror@1.0.58
	tokio@1.37.0
	toml@0.7.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	udev@0.2.0
	unicode-ident@1.0.12
	uninitialized@0.0.2
	unsafe-libyaml@0.2.11
	v4l-sys@0.3.0
	v4l@0.14.0
	void@1.0.2
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	wayland-client@0.29.5
	wayland-commons@0.29.5
	wayland-protocols@0.29.5
	wayland-scanner@0.29.5
	wayland-sys@0.29.5
	which@4.4.2
	widestring@1.0.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	winnow@0.5.40
	xdg@2.5.2
	xml-rs@0.8.19
	yaml-rust@0.4.5
"

inherit udev cargo systemd

DESCRIPTION="Automatic brightness adjustment based on screen contents and ALS"
HOMEPAGE="https://github.com/maximbaz/wluma"
SRC_URI="
	https://github.com/maximbaz/wluma/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="ISC"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD ISC MIT Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-libs/libv4l:=
	media-libs/vulkan-loader:=
"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="/usr/bin/${PN}"

DOCS=(
	README.md
)

src_install() {
	cargo_src_install
	udev_dorules 90-wluma-backlight.rules

	insinto /etc/xdg/autostart
	doins "${FILESDIR}"/wluma.desktop
	systemd_douserunit "${PN}.service"

	insinto /usr/share/${P}
	doins config.toml

	dodoc "${DOCS[@]}"
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
