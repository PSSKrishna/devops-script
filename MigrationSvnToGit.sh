#!/bin/bash

#Create by yassine AIT ELBAZ : aitelbaz.yassine@gmail.com
hostSvn='svn://IpAdress'
hostGit='https://hostGit/organisation'
echo "entrer les noms des projets (projet1,projet2....)"
read noms

echo "entrer utilisateur git"
read usernameGit

echo "entrer mot de passe git"
read passwordGit

#echo "$noms"
nb_projet=`echo "$noms" | tr ',' ' ' | wc -w`
#echo "$nb_projet"

for (( i=1; i<=$nb_projet; i++ ))
do
        projet=`echo "$noms" | cut -d ',' -f $i `
        echo "$projet"
        mkdir $projet
        cd $projet
        echo "Export svn \n"
        svn2git $hostSvn/$projet
        echo "add remote git \n"
        git remote add origin $hostGit/$projet
        echo "disabled http.sslVerify"


        git config http.sslVerify false

        git  push origin master
        cd ..
        rm -rf $projet

done
