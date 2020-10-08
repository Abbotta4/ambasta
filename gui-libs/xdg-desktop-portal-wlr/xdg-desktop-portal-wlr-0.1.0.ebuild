# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg

DESCRIPTION="xdg-desktop-portal backend for wlroots"
HOMEPAGE="https://github.com/emersion/xdg-desktop-portal-wlr"
SRC_URI="https://github.com/emersion/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND="
	media-video/pipewire
	dev-libs/wayland
	dev-libs/wayland-protocols
	sys-apps/xdg-desktop-portal
	systemd? ( sys-apps/systemd )"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	sys-devel/gettext"

src_prepare() {
	xdg_src_prepare
}

src_configure() {
	local emesonargs=(
		$(meson_feature systemd)
	)
	meson_src_configure
}