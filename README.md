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

	- uRamdisk modified (Original from AllesterFox)

		Can boot original firmware, debian from AllesterFox,
		alpine linux.  It looks for a linux part as 2nd on usb stick
		and boots from there.  If there is none, it boots from 3rd
		partition on SATA drive.  Copy to /boot on 1st partition of
		the usb stick or to 3rd partition of the harddrive.

* [alpine linux](https://alpinelinux.org/) diskless image

	- alpine-wdmc-gen2-3.6.2-armhf.tar.gz

		contains a complete bootable diskless image of alpine linux.
		modified to ignore "root=". "root" is not setable on
		WD My Cloud. And enabled SSH daemon, you can ssh to it after
		booting. *root account has no password.*
		Kernel 4.12 is included, but no modules.

	- alpine initramfs image with ssh (without password!)

* install
	- Use an USB 2.0 stick!
		I had the problem, that usb 3.0 sticks aren't always booting.
		If you have only an usb 3.0 stick, remove stick, turn wdmc2 on,
		when the blue light blinks insert usb stick fast, using this i
		could boot from usb 3.0 sick.

	- make a dos partition table (not gpt) on usb stick.
	- make a partition "W95 FAT32 (LBA)" numeric 0x0C on usb stick
	- make a FAT32 filesystem on usb stick.
	- extact alpine-wdmc-gen2-3.6.2-armhf.tar.gz to the root of the
	  usb stick.

	  You should have:
	  ```
-rwxr-xr-x    1 root     root            26 Jun 17 11:47 .alpine-release
-rwxr-xr-x    1 root     root          3427 Jan  1  1980 alpine.apkovl.tar.gz
drwxr-xr-x    3 root     root          4096 Jun 17 11:47 apks
drwxr-xr-x    5 root     root          4096 Jul  5 12:02 boot
	```
	on the usb stick.

