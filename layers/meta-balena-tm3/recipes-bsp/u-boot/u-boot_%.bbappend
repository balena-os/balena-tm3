FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

SRC_URI:append = " \
    file://balenaos_bootcommand.cfg \
"

BALENA_BOOT_PARTITION_FILES:append = " \
    tm3-hb8-7-c.dtb: \
"

# Causes u-boot to not boot or something odd!!11111

#FILESEXTRAPATHS:append := ":${THISDIR}/files"

# Add re-worked patch resin-specific-env-integration-kconfig_reworked.patch
#SRC_URI:append = " \
#		file://resin-specific-env-integration-kconfig_reworked.patch \
#		"
