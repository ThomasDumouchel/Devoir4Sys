#!/bin/bash
#Titre			:encodagePositionnel.sh
#But			:renvoit encodage d'un nombre decimal en une base specifie
#Auteur			:Thomas Dumouchel(20146072) et Nazli Beitollahpour(20010248)
#Date			:2019-04-17
#===================================================================================

NUM=${1#-}			#retourne la valeur absolue du nombre
BASE=$2

#========Validation de nos arguments==========
if [ $# -ne 2 ]; then			#valide qu'il y a 2 arguments
	echo "OUPS: 2 arguments sont requis, $# fourni"
	exit 1
fi
if ! [[ $1 =~ ^[+-]?[0-9]+$ ]]; then		#valide que l'argument 1 soit un entier
	echo "OUPS: argument 1 doit etre un entier, $1 fourni"
	exit 1
fi
if ! [[ $2 =~ ^[2-9]{1}$ ]]; then	#valide que l'argument 2 soit un entier entre 2 et 9
	echo "OUPS: argument 2 doit etre un entier entre 2 et 9 inclusivement, $2 fourni"
	exit 1
fi
#===============Fin validation================

ANSWER=""
while [ $NUM -gt 0 ]; do
	mod=$(( $NUM%$BASE ))
	ANSWER="$mod$ANSWER"
	NUM=$(( $NUM/$BASE ))
done

if [ $1 -lt 0 ]; then
	ANSWER="-$ANSWER"	 #ajoute - si le nombre est negatif
else
	ANSWER="+$ANSWER"	 #ajoute + si le nombre est positif
fi

if [ $1 -eq 0 ]; then
	echo "L'encodage positionnel du nombre 0 en n'importe qu'elle base est 0"
else
	echo "L'encodage positionnel du nombre $1 en base $BASE est $ANSWER"
fi
