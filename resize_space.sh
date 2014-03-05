#!/bin/bash
#Script per ridimensionare la partiziione di un sito
#indicando la dimensione in Megs (M) o in Giga (G)

echo "Ridimensiona spazio web..."
echo -n "Indicare sito web: "
read NOMESITO
DIMENSIONE=`du -sh /var/path/$NOMESITO.ext3`
echo "Dimensione attuale: $DIMENSIONE"
echo -n "Nuova dimensione indicando l'unità di grandezza: "
read NEWSIZE
echo $NEWSIZE
echo "Procedo con il ridimensionamento di $NOMESITO..."
echo "Smonto $NOMESITO"
umount -f /var/path/$NOMESITO.ext3
e2fsck -f /var/path/$NOMESITO.ext3
echo "Rdimensionamento..."
resize2fs -p /var/path/$NOMESITO.ext3 $NEWSIZE
echo "Monto il sito"
mount -a
echo -n "Rdimensionamento $NOMESITO avvenuto, la nuova dimensione è: "
du -sh /var/path/$NOMESITO.ext3
