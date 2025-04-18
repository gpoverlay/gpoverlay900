# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11,12,13} )
inherit linux-info python-any-r1 toolchain-funcs

MY_P=linux-${PV}

DESCRIPTION="Developer documentation generated from the Linux kernel"
HOMEPAGE="https://www.kernel.org/"
SRC_URI="https://www.kernel.org/pub/linux/kernel/v6.x/${MY_P}.tar.xz"

S=${WORKDIR}/${MY_P}
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~m68k ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE="graphviz"

RDEPEND="graphviz? ( >=media-gfx/graphviz-5.0.0 )"

BDEPEND="${PYTHON_DEPS}
	>=dev-python/sphinx-7.2.3
	dev-python/sphinx-rtd-theme
	media-libs/fontconfig
	$(python_gen_any_dep '
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	')"

src_prepare() {
	default
	# Fix the Python shebangs.
	python_fix_shebang "${S}/Documentation/sphinx/"
}

src_compile() {
	local ARCH="$(tc-arch-kernel)"
	unset KBUILD_OUTPUT
	HTML_DOCS=( Documentation/output/. )
	emake htmldocs
}

src_install() {
	einstalldocs
}
