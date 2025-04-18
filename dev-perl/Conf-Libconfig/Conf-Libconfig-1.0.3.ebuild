# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Please test that dev-util/conf2struct builds with any bumps! See bug #908989.
# Conf-Libconfig is only in tree for it.

DIST_AUTHOR=CNANGEL
inherit perl-module

DESCRIPTION="Perl extension for libconfig"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~m68k ~mips ~s390 ~x86"

RDEPEND="
	dev-libs/libconfig:=
	virtual/perl-XSLoader
"
DEPEND="
	dev-libs/libconfig:=
"
BDEPEND="
	${RDEPEND}
	dev-perl/ExtUtils-PkgConfig
	test? (
		>=dev-perl/Test-Exception-0.430.0
		>=dev-perl/Test-Deep-1.127.0
		>=dev-perl/Test-Warn-0.320.0
	)
"

PERL_RM_FILES=(
	"t/boilerplate.t"
	"t/pod-coverage.t"
	"t/pod-spell.t"
	"t/pod.t"
)

src_prepare() {
	#rm inc/Devel/CheckLib.pm || die
	perl-module_src_prepare
}
