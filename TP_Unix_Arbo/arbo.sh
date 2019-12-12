#!/bin/bash


LRED='\001\033[01;31m\002'
LGREEN='\001\033[01;32m\002'
LYELLOW='\001\033[01;33m\002'
LBLUE='\001\033[01;34m\002'
LMAGENTA='\001\033[01;35m\002'
LPURPLE='\001\033[01;35m\002'
LCYAN='\001\033[01;36m\002'



arbo="/tmp/ARBO/"
rand_5_10=$((5+$RANDOM%(1+10-5)))
percent_odt=10
percent_ods=12 # ATTENTION Afin de REDUIRE LE NONBRE DE FICHIERS CREES J'AI INVERSE LE % DE ods ET tex
percent_odp=4
percent_txt=24
percent_tex=15 # ATTENTION Afin de REDUIRE LE NONBRE DE FICHIERS CREES J'AI REDUIT LE %  tex DE 50% à 15%

rm -r $arbo

mkdir $arbo
for rep1 in $(seq 1 $rand_5_10)
do rand_rep=$((4+$RANDOM%(1+6-4)))
repname1="$arbo"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
mkdir -v $repname1
rand_1_5=$((1+$RANDOM%(1+5-1)))

    for rep2 in $(seq 1 $rand_1_5)
    do rand_rep=$((4+$RANDOM%(1+6-4)))
    repname2="$repname1/"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
    mkdir -v $repname2
    rand_5_10=$((5+$RANDOM%(1+10-5)))

        for rep3 in $(seq 1 $rand_5_10)
        do rand_rep=$((4+$RANDOM%(1+6-4)))
        repname3="$repname2/"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
        mkdir -v $repname3
        done
    done
done

#folders_tree1=$(ls $arbo)

# La creation de fichier est repetitive donc on cree une fontion pour la creation de fichiers
function createFile ()
{
loop=0
    while  [[ $loop -lt $3 ]]
    do loop=$((loop+1))
    rand_file=$((6+$RANDOM%(1+8-6))) #Generation de nombre aleatoire pour la taille du nom du fichier
    # generation d'un nom aleatoire de taille alleatoire
    filename="$arbo""$1""/"$(cat /dev/urandom |tr -dc 'a-z0-9_-' | head -c $rand_file ; echo)
        # verifie si le parametre recu est egal a .tex si c'est le cas creation du fichier avec les extentions requises
        if [[ "$2" == ".tex" ]] 
        then touch $filename"$2"
        touch $filename".pdf"
        touch $filename".log"
        touch $filename".aux"
        touch $filename".sty"
        echo -e ${LBLUE}$filename"$2"
        else touch $filename"$2"
        echo -e ${LYELLOW}$filename"$2"
        fi
    done
}

#recuperation des noms des dossiers existants
folders=$(ls -RU $arbo |grep "$arbo"|cut -d "/" -f 4-10 |tr -d ":")

#creation de boucle qui va boucler sur chaque dossier et creer les fichiers a l'interieur 
for folder in $folders
    do rand_15_25=$((15+$RANDOM%(1+25-15))) #generation d'un nombre alleatoire, ce nombre correspond au nombre de fichiers crees dans le dossier en cours
    #calcul du nombre de fichiers à créer par extension, en utilisant le nombre ramdon et le percentage correspondant a l'extention
    nfile_odt=$(((percent_odt*$rand_15_25/100)))
    nfile_ods=$(((percent_ods*$rand_15_25/100)))
    nfile_odp=$(((percent_odp*$rand_15_25/100)))
    nfile_txt=$(((percent_txt*$rand_15_25/100)))
    nfile_tex=$(((percent_tex*$rand_15_25/100)))
    # verification pour chaque extention si le nombre de fichiers a crer est superieur a 0 si c'est le cas \n
    # alors on fait appel a la fontion cree precedament et on lui transmet les parametres \n 
    # "chemin dossier en cours" "l'extention du fichier" et ne "nombre de fichier a creer"
    if [[ $nfile_odt -gt 0 ]]
    then createFile "$folder" ".odt" "$nfile_odt"
    fi

    if [[ $nfile_ods -gt 0 ]]
    then createFile "$folder" ".ods" "$nfile_ods"
    fi

    if [[ $nfile_odp -gt 0 ]]
    then createFile "$folder" ".odp" "$nfile_odp"
    fi

    if [[ $nfile_txt -gt 0 ]]
    then createFile "$folder" ".txt" "$nfile_txt"
    fi

    if [[ $nfile_odt -gt 0 ]]
    then createFile "$folder" ".tex" "$nfile_tex"
    fi
done

echo " "
echo -e ${LGREEN}"FIN"
