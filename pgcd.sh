#!/bin/bash
#titre			: pgcd.sh
#But			: Ce script trouvera le pgcd de deux entiers
#Date			: 2019-04-17
#Auteurs		: Thomas Dumouchel(20146072) et Nazli Beitolahpour()
#============================================================================


if [ $# -ne 2 ] || ! [[ $1 =~ ^[1-9]{1}[0-9]+$ ]] || ! [[ $2 =~ ^[1-9]{1}[0-9]+$ ]]; then
	echo "les parametres saisis ne sont pas deux entiers positifs"
	exit 1
fi

xInit=$1
yInit=$2

x=$xInit
y=$yInit

while [ $x != $y ]; do
	if [ $x -gt $y ]; then
		x=$(($x - $y))
	else
		y=$(($y - $x))
	fi
done

echo "PGCD de $xInit et $yInit est $x"
