# edge-ai-image.bb

SUMMARY = "The edge AI core image"
LICENSE = "MIT"

inherit core-image

# kernel changes to boot from /boot
IMAGE_INSTALL:append = " \
    kernel-image \
    kernel-devicetree \
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
    linux-firmware-bcm4359-pcie \
"

IMAGE_FSTYPES:append = " ext4.zst"
WKS_FILE = "edge-ai-boot.wks.in"
