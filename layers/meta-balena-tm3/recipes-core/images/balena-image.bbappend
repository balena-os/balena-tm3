include balena-image.inc

BALENA_BOOT_SIZE="128000"
IMAGE_ROOTFS_SIZE = "319488"
IMAGE_OVERHEAD_FACTOR = "1.0"
IMAGE_ROOTFS_EXTRA_SPACE = "53248"
IMAGE_ROOTFS_MAXSIZE="500000"
SPLASH = ""

BALENA_BOOT_PARTITION_FILES:append = " \
    boot.scr:/boot.scr \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/${KERNEL_IMAGETYPE} \
    tm3-hb8-7-c.dtb:/tm3-hb8-7-c.dtb"

IMAGE_CMD:balenaos-img:append () {
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-sunxi-with-spl.bin of=${BALENA_RAW_IMG} conv=notrunc seek=8 bs=1024
}
