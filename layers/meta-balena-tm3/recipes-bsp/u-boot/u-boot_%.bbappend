UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot

# Causes u-boot to not boot or something odd!!11111

#FILESEXTRAPATHS:append := ":${THISDIR}/files"

# Add re-worked patch resin-specific-env-integration-kconfig_reworked.patch
#SRC_URI:append = " \
#		file://resin-specific-env-integration-kconfig_reworked.patch \
#		"
