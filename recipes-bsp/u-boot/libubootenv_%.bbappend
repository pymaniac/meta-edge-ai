FILESEXTRAPATHS:append := "${THISDIR}/${PN}:"

SRC_URI:append = " file://fw_env.config "

do_install:append() {
    install -p -Dm 644 ${WORKDIR}/fw_env.config ${D}${libdir}/fw_env.config 
    install -d ${D}${sysconfdir}
    ln -s ${libdir}/fw_env.config "${D}${sysconfdir}/fw_env.config"
}

FILES:${PN}:append = " \
    ${libdir}/fw_env.config \
    ${sysconfdir}/fw_env.config \
"