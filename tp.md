# Initiation à Linux : TP

Commencez par ouvrir un terminal et on va pouvoir parler sérieusement.

## Quelques commandes de base

### Changer de répertoire courant

Sous Linux, quand vous ouvrez un terminal, une instance de votre shell
(probablement /bin/bash de base) se lance. Le shell est un programme qui attend
que vous lui donniez des commandes et qui va simplement s'occuper de les
exécuter.

Une instance d'un shell possède ce qu'on appelle un *répertoire courant*. C'est
en gros le dossier dans lequel vous vous trouvez actuellement.

Pour connaître son répertoire courant, on entre la commande `pwd` (print
working directory)

Pour changer de répertoire courant, on entre la commande `cd` (change
directory)

### Lister les fichiers/dossiers

Pour lister les fichiers/dossiers du répertoire courant, on entre la commande
`ls` (list)

Vous pouvez aller plus loin avec `ls` et lister les fichiers en fonction de
leur taille, de leur date de modification ou de création.

Essayez `ls -lah` pour voir.

***

Si vous voulez en savoir plus, entrez la commande `man ls` qui appellera le
programme man (manual) qui vous donnera des informations sur la commande que
vous lui envoyez en paramètre (`man ls` vous donnera des infos sur `ls` et
`man cd` des informations sur `cd`).

### Les fichiers (et dossier)

"Everything is a file" - *UNIX*

#### Créer un fichier

Pour créer un fichier, vous pouvez utiliser `touch`.

Placez vous dans le répertoire où vous désirez créer un fichier et taper
`touch mon_fichier.txt`

Vous pouvez aussi ouvrir directement le fichier avec *vim* (un éditeur de texte
en ligne de commande) et le sauvegarder ultérieurement : `vim mon_fichier.txt`
et une fois dans vim : `:w` (write) suivi de la touch `Enter`.

**Et pour créer un dossier, on fait comment ?**

Il vous suffit d'utiliser la commande `mkdir` : `mkdir mon_dossier`

### Afficher le contenu d'un fichier

Pour afficher (ou print) le contenu d'un fichier dans le terminal, entrez la
commande `cat` (concatenate) : `cat mon_fichier.txt`

#### Déplacer (ou renommer) un fichier

Pour déplacer un fichier : `mv chemin/vers/fichier.txt nouveau/chemin/vers/fichier.txt` (move)

Si vous voulez renommer un fichier, vous le déplacez de son ancien nom vers son
nouveau nom, tout simplement : `mv fichier_old.txt fichier_new.txt`

#### Copier un fichier

Pour copier un fichier : `cp fichier1.txt fichier2.txt` (copy)

Si vous voulez copier un dossier complet (avec les fichiers et sous-dossiers à
l'intérieur) vous devez rajouter un attribut à `cp` : l'attribut `-r`
(recursive) : `cp -r mon_dossier/ mon_nouveau_dossier`.

#### Supprimer un fichier

rm

> et pour un dossier ? rm -rf

### Rechercher dans un fichier

cat + grep


### Gestion des droits sur les fichiers

chmod chown

## Des programmes utiles

### Information système

du
df
ifstatus
ps aux


### Networking

nsc jogsoul ping ssh scp

### Media

evince feh wget

## Variables d'environnement

### Modifier une variable d'environnement
