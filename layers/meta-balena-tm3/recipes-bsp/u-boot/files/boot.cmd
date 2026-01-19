regulator dev vcc-wifi
regulator value 3300000
regulator enable

setexpr.l serialno *030062f4

setenv resin_kernel_load_addr ${kernel_addr_r}
run resin_set_kernel_root

if test -n ${custom_mac}; then
    setenv mac ${custom_mac};
else
    setexpr.b m0 *30062e8;
    setexpr.b m1 *30062e9;
    setexpr.b m2 *30062ea;
    setexpr.b m3 *30062eb;
    setexpr.b m4 *30062ec;
    setexpr.b m5 *30062ed;
    setenv mac "$m0:$m1:$m2:$m3:$m4:$m5";
fi;

setenv bootargs "${bootargs} ${resin_kernel_root} console=ttyS0 console=tty1 sunxi-gmac.mac_str=$mac fuse.serialno=$serialno rootwait"

if test -n ${custom_fdt_file}; then
    setenv fdt_file ${custom_fdt_file};
else
    setenv hb hb8;
    i2c dev 0;
    if i2c probe 0x38; then
        setenv fdt_file tm3-${hb}-43-c.dtb;
    elif i2c probe 0x41; then
        setenv fdt_file tm3-${hb}-9-c.dtb;
    elif i2c probe 0x2a; then
        setenv fdt_file tm3-${hb}-12-c.dtb;
    else
        setenv fdt_file tm3-${hb}-7-r.dtb;
    fi;
fi;

load mmc ${mmc_bootdev}:1 0x40000000 ${fdt_file}
load ${resin_dev_type} ${resin_dev_index}:${resin_root_part} ${resin_kernel_load_addr} /boot/Image
booti ${resin_kernel_load_addr} - 0x40000000
