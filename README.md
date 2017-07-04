# wdmc-gen2
WD My Cloud  Gen2 (Kernel / Distribution / Information) drop


WD My Cloud (Gen2) - wdmc-gen2 - Marvell ARMADA 375
===================================================

* mainline kernel support
	tested with 4.11.x
	- device tree source
	- kernel config
	- kernel uImage with dtb

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
