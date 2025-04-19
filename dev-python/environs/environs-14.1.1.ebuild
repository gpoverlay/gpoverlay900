# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Python library for simplified environment variable parsing"
HOMEPAGE="
	https://github.com/sloria/environs/
	https://pypi.org/project/environs/
"
SRC_URI="
	https://github.com/sloria/environs/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/typing-extensions[${PYTHON_USEDEP}]
	' 3.10)
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/backports-strenum[${PYTHON_USEDEP}]
		' 3.10)
		dev-python/django-cache-url[${PYTHON_USEDEP}]
		dev-python/dj-database-url[${PYTHON_USEDEP}]
		dev-python/dj-email-url[${PYTHON_USEDEP}]
	)
"

DOCS=( CHANGELOG.md CONTRIBUTING.md README.md  )

distutils_enable_tests pytest
