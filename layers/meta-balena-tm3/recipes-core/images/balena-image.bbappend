BALENA_BOOT_SIZE="128000"
IMAGE_ROOTFS_SIZE = "319488"
IMAGE_OVERHEAD_FACTOR = "1.0"
IMAGE_ROOTFS_EXTRA_SPACE = "53248"
IMAGE_ROOTFS_MAXSIZE="500000"

LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

BALENA_BOOT_PARTITION_FILES:append = " \
    boot.scr:/boot.scr \
    Image: \
    tm3-hb8-7-c.dtb:"

IMAGE_CMD:balenaos-img:append () {
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-sunxi-with-spl.bin of=${BALENA_RAW_IMG} conv=notrunc seek=8 bs=1024
}
