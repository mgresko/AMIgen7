#!/bin/sh
#
# Script to clean up all devices mounted under $CHROOT
#
#################################################################

for BLK in $(mount | grep "${CHROOT}" | awk '{ print $3 }' | sort -r)
do
   umount "${BLK}"
   if [ $? -ne 0 ]; then
       lsof "${BLK}"
   fi
   echo "lazy unmounting"
   umount -l "${BLK}"
done
