This is a layer to capture my experiments of running edge ai on a iMX8 Quad Eval board.

Target Hardware: MCIMX8M-EVKB (i.MX8M Quad, 3GB LPDDR4, 16GB eMMC)
SoC: MIMX8MQ6DVAJZAB — 4x Cortex-A53 @ 1.5GHz + Cortex-M4
BSP: NXP Yocto BSP (scarthgap), DISTRO: fsl-imx-wayland
Build Host: Docker container on macOS

## Docker vs Hard Mounts - Yocto
Yocto requires hard links and xattrs; whereas Docker uses overlay fs. To get around this issue build-tmp and sstate cache are real mounts inside the container.

```
# 1. Create the sparsebundle (now you have ~190GB free, so 160GB is safe)
  hdiutil create -size 160g -fs "Case-sensitive APFS" -volname "Yocto" -type SPARSEBUNDLE ~/Yocto.sparsebundle
# 2. Mount it
  hdiutil attach ~/Yocto.sparsebundle
# 3. Move your existing BSP
  mv /Users/<user-name>/imx-yocto-build /Volumes/Yocto/imx-yocto-build
# 4. Run docker with the new path
  docker run -it --rm \
    -v /Volumes/Yocto/imx-yocto-build:/workdir \
    -v $SSH_AUTH_SOCK:/run/ssh-agent \
    -e SSH_AUTH_SOCK=/run/ssh-agent \
    imx8m-yocto-builder
```

## Cloning the repo
mkdir -p /workdir/imx-yocto-bsp && cd /workdir/imx-yocto-bsp
repo init -u https://github.com/nxp-imx/imx-manifest.git -b imx-linux-scarthgap -m imx-6.6.52-2.2.0.xml
repo sync


