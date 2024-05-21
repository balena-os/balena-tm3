inherit kernel-balena

BALENA_CONFIGS[rtl8192cu] = ""
BALENA_CONFIGS[ralink] = ""
BALENA_CONFIGS_DEPS[ralink] = ""
BALENA_CONFIGS[brcmfmac] = ""
BALENA_CONFIGS_DEPS[brcmfmac] = ""

# Changing nfsd to use =y, as got following error, with it built as a module -
# ERROR: "fivm_open_verify" [fs/nfsd/nfsd.ko] undefined!
BALENA_CONFIGS[nfsfs] = " \
    CONFIG_NFS_FS=m \
    CONFIG_NFS_V2=m \
    CONFIG_NFS_V3=m \
    CONFIG_NFS_V4=m \
    CONFIG_NFSD=y \
    CONFIG_NFSD_V3=y \
    CONFIG_NFSD_V4=y \
"
