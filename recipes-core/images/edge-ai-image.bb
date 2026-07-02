# edge-ai-image.bb

SUMMARY = "The edge AI core image"
LICENSE = "MIT"

inherit core-image

# kernel changes to boot from /boot
# fw_printenv, fw_setenv support
IMAGE_INSTALL:append = " \
    kernel-image \
    kernel-devicetree \
    libubootenv-bin \
    u-boot-imx \
"

# Install sshd and sftp
IMAGE_INSTALL:append = " \
    openssh-sftp-server \
    openssh-sshd \
    openssh \
    sshfs-fuse \
"

IMAGE_INSTALL:append = " \
    python3-numpy \
    python3-pip \
    tensorflow-lite \
    firmware-nxp-wifi-bcm4356-pcie \
    i2c-tools \
"

# Prevent a clash of bcm4356 firmware provided by nxp and wifi
# To note that they are identical, using nxp as its a nxp board.
IMAGE_INSTALL:remove = " linux-firmware-bcm4356-pcie"

PACKAGE_EXCLUDE += " \
    linux-firmware-ath10k \
    linux-firmware-bcm43455 \
    firmware-nxp-wifi-all-sdio \
    firmware-nxp-wifi-bcm4359-pcie \
    firmware-nxp-wifi-nxp8997-pcie firmware-nxp-wifi-nxp8997-sdio \
    firmware-nxp-wifi-nxp9098-pcie firmware-nxp-wifi-nxp9098-sdio \
"

IMAGE_FSTYPES:append = " ext4.zst"
WKS_FILE = "edge-ai-boot.wks.in"
