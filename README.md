# wdmc-gen2
WD My Cloud  Gen2 (Kernel / Distribution / Information) drop


WD My Cloud (Gen2) - wdmc-gen2 - Marvell ARMADA 375
===================================================

* mainline kernel support
	tested with 4.11.x / 4.12.x
	- device tree source
		armada-375-wdmc-gen2.dts
	- kernel config
		kernel-4.11.8.config, kernel-4.12.0.config
	- kernel uImage with dtb
		uImage (4.12.0)


	- build your own kernel

		- download kernel source from https://www.kernel.org/
		- extract the kernel archive
		- copy kernel-4.12.0.config to linux-4.12/.config 
		- copy armada-375-wdmc-gen2.dts to
		  linux-4.12/linux-4.12/arch/arm/boot/dts/
		- ready to build the kernel (you can use build_kernel_image.sh)
		```
		cd linux-4.12
		make -j2 zImage
		make armada-375-wdmc-gen2.dtb
		cat arch/arm/boot/zImage arch/arm/boot/dts/armada-375-wdmc-gen2.dtb > zImage_and_dtb
		mkimage -A arm -O linux -T kernel -C none -a 0x00008000 -e 0x00008000 -n 'WDMC-Gen2' -d zImage_and_dtb uImage
		rm zImage_and_dtb
		make -j2 modules modules_install

		```
		copy uImage to /boot of your boot partition

* alpine linux diskless image
	- uRamdisk modified (Original from AllesterFox)

	- alpine image with ssh (without password!!!)

* install
	- Use an USB 2.0 stick!
		I had the problem, that usb 3.0 sticks aren't always booting.
		If you have only an usb 3.0 stick, remove stick, turn wdmc2 on,
		when the blue light blinks insert usb stick fast, using this i
		could boot from usb 3.0 sick.

	- make a dos partition table (not gpt) on usb stick.
	- make a partition "W95 FAT32 (LBA)" numeric 0x0C on usb stick
	- make a FAT32 filesystem on usb stick.
