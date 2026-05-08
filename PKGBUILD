# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=no-kmod-autoload
pkgver=0.0
pkgrel=1
pkgdesc="Disable automatic loading of kernel modules"
arch=(any)
url=""
license=('TODO')
depends=()
makedepends=()
source=(
	Makefile
	no-kmod-autoload.service.in
	modprobe.sh
	start.sh.in
)
sha256sums=(
	SKIP
	SKIP
	SKIP
	SKIP
)

_make_opts=(prefix=/usr libexecdir=/usr/lib)

build() {
	cd "$srcdir"
	make "${_make_opts[@]}"
}

package() {
	cd "$srcdir"
	make "${_make_opts[@]}" DESTDIR="$pkgdir/" install
}
