# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8812AU"
PKG_VERSION="cab4e4ec56884f65e0c279c1b5ceaf70dbe79be0"
PKG_SHA256="20b498bc597e5343ee6c240eabd45c36894db86c76f6bfc100448c8b9c420733"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/aircrack-ng/rtl8812au"
PKG_URL="https://github.com/aircrack-ng/rtl8812au/archive/${PKG_VERSION}.tar.gz"
PKG_LONGDESC="Realtek RTL8812AU Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
