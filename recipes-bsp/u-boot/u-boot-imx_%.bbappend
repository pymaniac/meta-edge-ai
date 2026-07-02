FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " \
    file://0001-boot-from-ext4.patch \
"
do_install:append() {
    install -d ${D}${sysconfdir}
    install -D -p -m 0755 ${B}/${config}/u-boot-initial-env ${D}${sysconfdir}/u-boot-initial-env
}

FILES:${PN} += "${sysconfdir}/u-boot-initial-env"