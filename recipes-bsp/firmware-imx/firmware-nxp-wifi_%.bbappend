RPROVIDES:${PN}-bcm4356-pcie += "linux-firmware-bcm4356-pcie"
RREPLACES:${PN}-bcm4356-pcie += "linux-firmware-bcm4356-pcie"
RCONFLICTS:${PN}-bcm4356-pcie += "linux-firmware-bcm4356-pcie"

do_install:append() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm
    for f in cyw-wifi-bt/*_CYW4356/*; do
        install -m 0644 "$f" ${D}${nonarch_base_libdir}/firmware/brcm
    done
}

PACKAGES += "${PN}-bcm4356-pcie"

FILES:${PN}-bcm4356-pcie += " \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.bin \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.clm_blob \
    ${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-pcie.txt \
    ${nonarch_base_libdir}/firmware/brcm/BCM4354A2.1CX.hcd \
"