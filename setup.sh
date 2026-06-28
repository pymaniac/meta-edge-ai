# meta-edge-ai/setup.sh
if [ ! -f build/conf/local.conf ]; then
	MACHINE=imx8mq-evk DISTRO=fsl-imx-wayland source ./imx-setup-release.sh -b build
	cat sources/meta-edge-ai/conf/local.conf.append >> build/conf/local.conf
	echo "BBLAYERS += \"\${BSPDIR}/sources/meta-edge-ai\"" >> build/conf/bblayers.conf
else
	source setup-environment build
fi
