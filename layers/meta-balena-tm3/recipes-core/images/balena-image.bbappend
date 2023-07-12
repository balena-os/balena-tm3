LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"


BALENA_BOOT_PARTITION_FILES:append = " \
    u-boot-sunxi-with-spl.bin:/${SDIMG_KERNELIMAGE} \
    boot.scr:/boot.scr \
    tm3-hb8-7-c.dtb:/dt-blob.bin"
