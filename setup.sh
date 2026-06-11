# meta-edge-ai/setup.sh
MACHINE=imx8mq-evk DISTRO=fsl-imx-wayland source ./imx-setup-release.sh -b build
cat ../sources/meta-edge-ai/conf/local.conf.append >> conf/local.conf
sed -i 's/imx8mqevk/imx8mq-evk/g' conf/local.conf
echo "BBLAYERS += \"\${BSPDIR}/sources/meta-edge-ai\"" >> conf/bblayers.conf
