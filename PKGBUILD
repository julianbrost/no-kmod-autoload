# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=no-kmod-autoload
pkgver=0.1.0
pkgrel=1
pkgdesc='Disable automatic loading of kernel modules'
arch=(any)
url='https://codeberg.org/jb/no-kmod-autoload'
license=(MIT)
depends=(bash)
source=(
	LICENSE
	Makefile
	modprobe.sh
	no-kmod-autoload.service.in
	start.sh
)
sha256sums=(
	SKIP
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
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
