# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
GCONF_DEBUG="yes"

inherit gnome2

DESCRIPTION="A library that provides top functionality to applications"
HOMEPAGE="https://git.gnome.org/browse/libgtop"

LICENSE="GPL-2"
SLOT="2/10" # libgtop soname version
KEYWORDS="amd64 arm ~mips ppc x86"
IUSE="+introspection"

RDEPEND=">=dev-libs/glib-2.26:2"
DEPEND="${RDEPEND}
	>=dev-util/gtk-doc-am-1.4
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	introspection? ( >=dev-libs/gobject-introspection-0.6.7:= )
"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-musl.patch
}

src_configure() {
	gnome2_src_configure \
		--disable-static \
		$(use_enable introspection)
}