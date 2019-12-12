#!/bin/bash


LRED='\001\033[01;31m\002'
LGREEN='\001\033[01;32m\002'
LYELLOW='\001\033[01;33m\002'
LBLUE='\001\033[01;34m\002'
LMAGENTA='\001\033[01;35m\002'
LPURPLE='\001\033[01;35m\002'
LCYAN='\001\033[01;36m\002'

folder_range="/tmp/RANGE/"
folder_arbo="/tmp/ARBO"
folder_txt=$folder_range"TXT/"
folder_tex=$folder_range"LATEX/"
folder_od=$folder_range"ODT_ODS_ODP/" #Afin de rendres plus lisible le dossier Range j'ai cree un dossier pour ods odt odp 

rm -r $folder_range

mkdir $folder_range
mkdir $folder_txt
mkdir $folder_tex
mkdir $folder_od

folders_arbo=$(ls -RU $folder_arbo |grep "$folder_arbo"|tr ":" "/" |grep -v "//")

for folder in $folders_arbo
do rm  -f $folder*.log # dans le dossier en cours on suprime les fichier a suprimer
   rm  -f $folder*.aux
   rm  -f $folder*.sty

#Apres la supression des fichier,traitement des fichier txt
    files_txt=$(ls "$folder" |grep ".txt" )
        for file in $files_txt
        do mv -uv "$folder"$file $folder_txt
        done

#recuperation se tous les fichiers ods odp odt pour creer les dossiers et ranger les fichiers
    files_ov=$(ls "$folder" |grep -v ".pdf" |grep -v ".tex" |grep ".od") #a ce satde il nous reste 5 extensions don je vais retirer 2 pour garder odt ods otp
        for file in $files_od
        do folder_len=$(echo $file |cut -c 1 |tr "a-z" "A-Z")
           folder_len="$folder_len/"
           mkdir "$folder_od""$folder_len" 2> /dev/null
           mv -uv "$folder"$file "$folder_od""$folder_len"
        done
# il reste le traitement des fichiers tex et pdf

    files_te=$(ls "$folder" |grep -v ".pdf" |grep -v ".tex" |grep ".od") #a ce satde il nous reste 5 extensions don je vais retirer 2 pour garder odt ods otp
        for file in $files_te
        do folder_len=$(echo $file |cut -c 1 |tr "a-z" "A-Z")
           folder_len="$folder_len/"
           mkdir "$folder_od""$folder_len" 2> /dev/null
           mv -uv "$folder"$file "$folder_od""$folder_len"
        done
done

echo " "
echo -e ${LGREEN}"FIN"
