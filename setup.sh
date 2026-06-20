# meta-edge-ai/setup.sh
MACHINE=imx8mq-evk DISTRO=fsl-imx-fb source ./imx-setup-release.sh -b build
cat sources/meta-edge-ai/conf/local.conf.append >> build/conf/local.conf
echo "BBLAYERS += \"\${BSPDIR}/sources/meta-edge-ai\"" >> build/conf/bblayers.conf