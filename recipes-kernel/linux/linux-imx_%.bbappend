FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://wifi.cfg"

do_configure:append() {
    ${S}/scripts/kconfig/merge_config.sh -m -O ${B} ${B}/.config ${WORKDIR}/wifi.cfg
    cd ${B} && oe_runmake -C ${S} O=${B} olddefconfig
}