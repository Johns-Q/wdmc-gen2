


#make uImage LOADADDR=0x00008000
make -j2 zImage
make armada-375-wdmc-gen2.dtb
cat arch/arm/boot/zImage arch/arm/boot/dts/armada-375-wdmc-gen2.dtb > zImage_and_dtb
mkimage -A arm -O linux -T kernel -C none -a 0x00008000 -e 0x00008000 -n 'WDMC-Gen2' -d zImage_and_dtb uImage
rm zImage_and_dtb
