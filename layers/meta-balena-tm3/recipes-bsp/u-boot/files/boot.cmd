setenv resin_kernel_load_addr ${kernel_addr_r}
run resin_set_kernel_root
setenv bootargs "${bootargs} ${resin_kernel_root} console=ttyS0 console=tty1 rootwait"

if test -n ${custom_fdt_file}; then
    setenv fdt_file ${custom_fdt_file};
else
    setenv hb hb8;
    i2c dev 0;
    if i2c probe 0x38; then
        setenv fdt_file tm3-${hb}-7-c.dtb;
    elif i2c probe 0x41; then
        setenv fdt_file tm3-${hb}-9-c.dtb;
    elif i2c probe 0x2a; then
        setenv fdt_file tm3-${hb}-12-c.dtb;
    else
        setenv fdt_file tm3-${hb}-7-r.dtb;
    fi;
fi;

load mmc ${mmc_bootdev}:1 ${fdt_addr_r} ${fdt_file}
load ${resin_dev_type} ${resin_dev_index}:${resin_root_part} ${resin_kernel_load_addr} /boot/Image
booti ${resin_kernel_load_addr} - ${fdt_addr_r}
