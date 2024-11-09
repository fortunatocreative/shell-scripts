#!/bin/bash

if [ $(id -u) -ne 0 ]
then
	echo 'please run as root or sudo.'
	exit 1
fi

echo "Getting drives info, pick drive"
lsblk


## Choose drive location
echo "Enter drive location"
read -r drive


echo "Drive is ${drive} is this correct? Yes or No"
read -r agree
if [[ "$agree" = "Yes" ]]; then
    echo "Lets wipe out all partitions first..."
    sudo dd if=/dev/zero of=${drive} bs=512 count=1

    echo "umnount drive from system...."
    umount ${drive}
    echo "Lets wipe out all partitions first..."
    sudo dd if=/dev/zero of=${drive} bs=512 count=1
    echo "pick type of format: exfat, ntfs, vfat or udf"
    read -r choice
    echo "your choice is ${choice}"
    echo "Formatting drive with ${choice}...."
    mkfs.${choice} ${drive}
else
    echo "Enter drive again..."
fi

exit 1
