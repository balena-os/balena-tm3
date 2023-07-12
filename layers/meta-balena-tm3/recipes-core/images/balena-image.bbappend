include balena-image.inc

#BALENA_BOOT_PARTITION_FILES:append = " \
#    u-boot-sunxi-with-spl.bin:/${SDIMG_KERNELIMAGE} \
#    boot.scr:/boot.scr \
#    tm3-hb8-7-c.dtb:/dt-blob.bin"

IMAGE_CMD:balenaos-img:append () {
    dd if=${DEPLOY_DIR_IMAGE}/u-boot-sunxi-with-spl.bin of=${BALENA_RAW_IMG} conv=notrunc seek=8 bs=1024
}
