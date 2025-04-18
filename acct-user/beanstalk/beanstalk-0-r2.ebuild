# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="A user for app-misc/beanstalkd"

ACCT_USER_GROUPS=( "beanstalk" )
ACCT_USER_HOME="/var/lib/beanstalkd"
ACCT_USER_ID="137"

acct-user_add_deps
