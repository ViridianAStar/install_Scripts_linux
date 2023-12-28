#!/bin/bash

DRIVETOINSTALLON="$1"
USERNAME="$2"
PASSWD="$3"

timedatectl

(
  echo g; echo n; echo p; echo 1; echo ; echo 500; echo p; echo 2; echo ; echo 750; echo p; echo 3; echo ; echo ; echo w
) | fdisk "$DRIVETOINSTALLON"

BOOTPART="$DRIVETOINSTALLON""p1"
SWAPPART="$DRIVETOINSTALLON""p2"
FILESYSTEMPART="$DRIVETOINSTALLON""p3"

mkfs.fat -F 32 "$BOOTPART"
mkswap "$SWAPPART"
mkfs.ext4 "$FILESYSTEMPART"

mount "$FILESYSTEMPART" /mnt
mkdir -p /mnt/boot
mount "$BOOTPART" /mnt/boot
swapon "$SWAPPART"

pacstrap -i /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

cp -r inchrootscript.sh /mnt

arch-chroot /mnt /bin/bash <<"EOT"
bash inchrootscript.sh "$USERNAME" "$PASSWD"
EOT

umount -R /mnt

echo 
echo "Congratulations! Arch Linux is installed."
echo "5"
echo "4"
echo "3"
echo "2"
echo "1"
echo "Please shutdown the system by running [shutdown now], then unplug the USB install stick and boot the computer back up."
echo "If something goes wrong, please cope, seethe, and mald, as this software is provided without warranty of any kind."
