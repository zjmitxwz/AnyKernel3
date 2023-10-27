### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string= hech-kernelsu
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=miui
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties


# boot shell variables
block=boot;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

os=$(cat $home/os)
if [ -f $home/kernels/$os/Image ]; then
        mv $home/kernels/$os/Image $home/Image
else
        ui_print " -> There is no kernel for your OS in this zip! Aborting... "
        exit 1;
fi;

#if [ -f $home/kernels/$os/dtbo.img ]; then
#        mv $home/kernels/$os/dtbo.img $home/dtbo.img
#fi;

#if [ -f $home/kernels/$os/dtb ]; then
#        mv $home/kernels/$os/dtb $home/dtb
#fi;
split_boot;
flash_boot;
flash_dtbo;
