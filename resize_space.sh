#!/bin/bash
#Script per ridimensionare la partiziione di un sito
#indicando la dimensione in Megs (M) o in Giga (G)

#Edit this var for path
PATH=/var/path/


echo "Resize quota"
echo -n "Add quota name: "
read QUOTANAME
DIM=`du -sh $PATH$QUOTANAME.ext3`
echo "Size: $DIM"
echo -n "Insert new size,(M)ega or (G)iga: "
read NEWSIZE
echo $NEWSIZE
echo "Processing $QUOTANAME..."
echo "Umount $QUOTANAME..."
umount -f $PATH$QUOTANAME.ext3
e2fsck -f $PATH$QUOTANAME.ext3
echo "Resize..."
resize2fs -p $PATH$QUOTANAME.ext3 $NEWSIZE
echo "Mount"
mount -a
echo -n "That's ok!"
du -sh $PATH$QUOTANAME.ext3
