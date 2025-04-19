# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.14.0

EAPI=8

CRATES="
"

declare -A GIT_CRATES=(
	[alacritty_terminal]='https://github.com/zed-industries/alacritty;828457c9ff1f7ea0a0469337cc8a37ee3a1b0590;alacritty-%commit%/alacritty_terminal'
	[async-pipe]='https://github.com/zed-industries/async-pipe-rs;82d00a04211cf4e1236029aa03e6b6ce2a74c553;async-pipe-rs-%commit%'
	[async-stripe]='https://github.com/zed-industries/async-stripe;3672dd4efb7181aa597bf580bf5a2f5d23db6735;async-stripe-%commit%'
	[async-tls]='https://github.com/zed-industries/async-tls;1e759a4b5e370f87dc15e40756ac4f8815b61d9d;async-tls-%commit%'
	[blade-graphics]='https://github.com/kvark/blade;b16f5c7bd873c7126f48c82c39e7ae64602ae74f;blade-%commit%/blade-graphics'
	[blade-macros]='https://github.com/kvark/blade;b16f5c7bd873c7126f48c82c39e7ae64602ae74f;blade-%commit%/blade-macros'
	[blade-util]='https://github.com/kvark/blade;b16f5c7bd873c7126f48c82c39e7ae64602ae74f;blade-%commit%/blade-util'
	[cpal]='https://github.com/zed-industries/cpal;fd8bc2fd39f1f5fdee5a0690656caff9a26d9d50;cpal-%commit%'
	[dap-types]='https://github.com/zed-industries/dap-types;bfd4af084bbaa5f344e6925370d7642e41d0b5b8;dap-types-%commit%/dap-types'
	[font-kit]='https://github.com/zed-industries/font-kit;5474cfad4b719a72ec8ed2cb7327b2b01fd10568;font-kit-%commit%'
	[libwebrtc]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/libwebrtc'
	[livekit-api]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/livekit-api'
	[livekit-protocol]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/livekit-protocol'
	[livekit-runtime]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/livekit-runtime'
	[livekit]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/livekit'
	[lsp-types]='https://github.com/zed-industries/lsp-types;1fff0dd12e2071c5667327394cfec163d2a466ab;lsp-types-%commit%'
	[notify-types]='https://github.com/zed-industries/notify;bbb9ea5ae52b253e095737847e367c30653a2e96;notify-%commit%/notify-types'
	[notify]='https://github.com/zed-industries/notify;bbb9ea5ae52b253e095737847e367c30653a2e96;notify-%commit%/notify'
	[nvim-rs]='https://github.com/KillTheMule/nvim-rs;764dd270c642f77f10f3e19d05cc178a6cbe69f3;nvim-rs-%commit%'
	[pet-conda]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-conda'
	[pet-core]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-core'
	[pet-env-var-path]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-env-var-path'
	[pet-fs]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-fs'
	[pet-global-virtualenvs]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-global-virtualenvs'
	[pet-homebrew]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-homebrew'
	[pet-jsonrpc]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-jsonrpc'
	[pet-linux-global-python]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-linux-global-python'
	[pet-mac-commandlinetools]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-mac-commandlinetools'
	[pet-mac-python-org]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-mac-python-org'
	[pet-mac-xcode]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-mac-xcode'
	[pet-pipenv]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-pipenv'
	[pet-pixi]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-pixi'
	[pet-poetry]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-poetry'
	[pet-pyenv]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-pyenv'
	[pet-python-utils]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-python-utils'
	[pet-reporter]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-reporter'
	[pet-telemetry]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-telemetry'
	[pet-venv]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-venv'
	[pet-virtualenv]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-virtualenv'
	[pet-virtualenvwrapper]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-virtualenvwrapper'
	[pet-windows-registry]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-windows-registry'
	[pet-windows-store]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet-windows-store'
	[pet]='https://github.com/microsoft/python-environment-tools;1abe5cec5ebfbe97ca71746a4cfc7fe89bddf8e0;python-environment-tools-%commit%/crates/pet'
	[reqwest]='https://github.com/zed-industries/reqwest;fd110f6998da16bbca97b6dddda9be7827c50e29;reqwest-%commit%'
	[tree-sitter-gitcommit]='https://github.com/zed-industries/tree-sitter-git-commit;88309716a69dd13ab83443721ba6e0b491d37ee9;tree-sitter-git-commit-%commit%'
	[tree-sitter-gomod]='https://github.com/camdencheek/tree-sitter-go-mod;6efb59652d30e0e9cd5f3b3a669afd6f1a926d3c;tree-sitter-go-mod-%commit%'
	[tree-sitter-gowork]='https://github.com/zed-industries/tree-sitter-go-work;acb0617bf7f4fda02c6217676cc64acb89536dc7;tree-sitter-go-work-%commit%'
	[tree-sitter-heex]='https://github.com/zed-industries/tree-sitter-heex;1dd45142fbb05562e35b2040c6129c9bca346592;tree-sitter-heex-%commit%'
	[tree-sitter-md]='https://github.com/tree-sitter-grammars/tree-sitter-markdown;9a23c1a96c0513d8fc6520972beedd419a973539;tree-sitter-markdown-%commit%'
	[tree-sitter-yaml]='https://github.com/zed-industries/tree-sitter-yaml;baff0b51c64ef6a1fb1f8390f3ad6015b83ec13a;tree-sitter-yaml-%commit%'
	[webrtc-sys-build]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/webrtc-sys/build'
	[webrtc-sys]='https://github.com/zed-industries/livekit-rust-sdks;80bb8f4c9112789f7c24cc98d8423010977806a6;livekit-rust-sdks-%commit%/webrtc-sys'
	[xim-ctext]='https://github.com/XDeme1/xim-rs;d50d461764c2213655cd9cf65a0ea94c70d3c4fd;xim-rs-%commit%/xim-ctext'
	[xim-parser]='https://github.com/XDeme1/xim-rs;d50d461764c2213655cd9cf65a0ea94c70d3c4fd;xim-rs-%commit%/xim-parser'
	[xim]='https://github.com/XDeme1/xim-rs;d50d461764c2213655cd9cf65a0ea94c70d3c4fd;xim-rs-%commit%'
)

LLVM_COMPAT=( 19 )
RUST_MIN_VER="1.85.0"
RUST_NEEDS_LLVM=1
WEBRTC_COMMIT="b99fd2c-6"

inherit cargo check-reqs desktop flag-o-matic llvm-r1 toolchain-funcs xdg

DESCRIPTION="The fast, collaborative code editor"
HOMEPAGE="https://zed.dev https://github.com/zed-industries/zed"
SRC_URI="
	https://github.com/zed-industries/zed/archive/refs/tags/v${PV/_/-}.tar.gz -> ${P}.tar.gz
	https://gitlab.com/api/v4/projects/35204985/packages/generic/${PN}/${PV}/${P}-crates.tar.xz
	amd64? (
		https://github.com/livekit/rust-sdks/releases/download/webrtc-${WEBRTC_COMMIT}/webrtc-linux-x64-release.zip ->
			webrtc-${WEBRTC_COMMIT}-linux-x64-release.zip
	)
	arm64? (
		https://github.com/livekit/rust-sdks/releases/download/webrtc-${WEBRTC_COMMIT}/webrtc-linux-arm64-release.zip ->
			webrtc-${WEBRTC_COMMIT}-linux-arm64-release.zip
	)
	${CARGO_CRATE_URIS}"

S="${WORKDIR}/${PN}-${PV/_/-}"
LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 ISC
	LGPL-3 MIT MPL-2.0 UoI-NCSA openssl Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="gles"
CHECKREQS_DISK_BUILD="9G"
CHECKREQS_MEMORY="16G"

DEPEND="
	app-arch/zstd:=
	app-misc/jq
	dev-db/sqlite:3
	>=dev-libs/libgit2-1.9.0:=
	dev-libs/mimalloc
	dev-libs/openssl:0/3
	dev-libs/protobuf
	dev-libs/wayland
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	dev-util/vulkan-tools
	|| (
		media-fonts/dejavu
		media-fonts/cantarell
		media-fonts/noto
		media-fonts/ubuntu-font-family
	)
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/vulkan-loader[X]
	net-analyzer/openbsd-netcat
	net-misc/curl
	sys-libs/zlib
	x11-libs/libxcb:=
	x11-libs/libxkbcommon[X]
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	dev-build/cmake
	dev-util/vulkan-headers
	sys-devel/gettext
	sys-devel/mold
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
		llvm-core/llvm:${LLVM_SLOT}=
	')
"

QA_FLAGS_IGNORED="usr/bin/zedit"

pkg_setup() {
	if tc-is-gcc; then
		export CARGO_PROFILE_RELEASE_LTO="true"
	elif tc-is-clang; then
		export CARGO_PROFILE_RELEASE_LTO="thin"
	fi
	strip-unsupported-flags
	# flags from upstream
	export RUSTFLAGS="${RUSTFLAGS} -C symbol-mangling-version=v0 --cfg tokio_unstable -C link-arg=-fuse-ld=mold -C link-args=-Wl,--disable-new-dtags,-rpath,\$ORIGIN/../lib"
	# fix error in livekit-rust-sdks
	export RUSTFLAGS="${RUSTFLAGS} -A unexpected_cfgs"
	if use gles; then
		export RUSTFLAGS="${RUSTFLAGS} --cfg gles"
	fi
	llvm-r1_pkg_setup
	rust_pkg_setup
}

src_prepare() {
	default

	export APP_CLI="zedit"
	export APP_ICON="zed"
	if [[ "${PV}" == *pre ]]; then
		export APP_ID="dev.zed.Zed-Preview"
	else
		export APP_ID="dev.zed.Zed"
	fi
	export APP_NAME="Zed"
	export APP_ARGS="%U"
	export DO_STARTUP_NOTIFY="true"
	envsubst < "crates/zed/resources/zed.desktop.in" > ${APP_ID}.desktop || die

	# Cargo offline fetch workaround
	local CPAL_COMMIT="fd8bc2fd39f1f5fdee5a0690656caff9a26d9d50"
	local CPAL_GIT="git = \"https://github.com/zed-industries/cpal\", rev = \"${CPAL_COMMIT}\""
	local CPAL_PATH="path = \"${WORKDIR}/cpal-${CPAL_COMMIT}\""

	local ASYNC_TLS_COMMIT="1e759a4b5e370f87dc15e40756ac4f8815b61d9d"
	local ASYNC_TLS_GIT="git = \"https://github.com/zed-industries/async-tls\", rev = \"${ASYNC_TLS_COMMIT}\""
	local ASYNC_TLS_PATH="path = \"${WORKDIR}/async-tls-${ASYNC_TLS_COMMIT}\""

	local NOTIFY_COMMIT="bbb9ea5ae52b253e095737847e367c30653a2e96"
	local NOTIFY_GIT="notify = { git = \"https://github.com/zed-industries/notify.git\", rev = \"${NOTIFY_COMMIT}\""
	local NOTIFY_PATH="notify = \\{ path = \"${WORKDIR}/notify-${NOTIFY_COMMIT}/notify\""
	local NOTIFY_TYPES_GIT="notify-types = { git = \"https://github.com/zed-industries/notify.git\", rev = \"${NOTIFY_COMMIT}\""
	local NOTIFY_TYPES_PATH="notify-types = \\{ path = \"${WORKDIR}/notify-${NOTIFY_COMMIT}/notify-types\""

	sed -e "s#${CPAL_GIT}#${CPAL_PATH}#" \
		-e "s#${ASYNC_TLS_GIT}#${ASYNC_TLS_PATH}#" \
		-e "s#${NOTIFY_GIT}#${NOTIFY_PATH}#" \
		-e "s#${NOTIFY_TYPES_GIT}#${NOTIFY_TYPES_PATH}#" \
		-i "${S}/Cargo.toml" || die "Cargo fetch workaround failed"
}

src_configure() {
	cargo_src_configure --all-features
}

src_compile() {
	export RELEASE_VERSION="${PV}"
	export ZED_UPDATE_EXPLANATION='Updates are handled by portage'
	if use arm64; then
		export LK_CUSTOM_WEBRTC="${WORKDIR}/linux-arm64-release"
	elif use amd64; then
		export LK_CUSTOM_WEBRTC="${WORKDIR}/linux-x64-release"
	fi
	cargo_src_compile --package zed --package cli
}

src_install() {
	newbin $(cargo_target_dir)/cli ${APP_CLI}
	exeinto "/usr/libexec"
	newexe $(cargo_target_dir)/zed zed-editor

	newicon -s 512 crates/zed/resources/app-icon.png zed.png
	newicon -s 1024 crates/zed/resources/app-icon@2x.png zed.png
	domenu "${S}/${APP_ID}.desktop"
}

src_test () {
	mkdir -p "${HOME}/.config/zed" || die
	mkdir -p "${HOME}/.local/share/zed/logs/" || die

	SHELL=/usr/bin/sh RUST_BACKTRACE=full cargo_src_test -vv
}
