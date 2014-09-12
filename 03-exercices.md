## Les variables

La gestion des variables est assez simple en shell, elles n'ont pas de type (ce
ne sont que des chaines de caractères) et elles se déclarent simplement en
faisant `nom=valeur`.  Pour accéder à la variable `gconfs` on peut choisir
d'écrire `$gconfs` ou `${gconfs}` (on n'abordera pas les différences entre les
deux versions ici).  Enfin pour déclarer une variable dans l'environnement
global vous pouvez utiliser `export nom=valeur`.

## Redirections

Votre shell vous permet de manipuler des flux de données facilement grâce aux
redirections.  Ce sont (entre autres) les opérateurs `>`, `<`, `>>` et `|`.

Les flux sont par exemple les entrées et sortie d'une commande. La commande
`echo` par exemple affiche ses paramètres sur son flux de sortie, ainsi, la
commande `echo ceci est un test` affichera le texte "ceci est un test"
sur son flux de sortie, qui, par défaut, s'affichera donc sur votre écran.

`>` permet de rediriger un flux dans un fichier qu'il créera s'il n'existe pas
ou videra de son contenu dans le cas contraire.  En tapant `echo coucou >
README`, on crée un fichier `README` qui contiendra le texte `coucou`.
N'oubliez pas que cet opérateur détruit le contenu du fichier s'il existait
avant d'y mettre le nouveau, ça pourrait vous jouer des tours.

`>>` fonctionne comme `>` mais ajoute à la fin du fichier au lieu de le
vider.  Ainsi, si on reprend le fichier `README` et qu'on exécute `echo
"au revoir" >> README`, il contiendra maintenant "coucou" et "au revoir".

`<` permet de donner un fichier en entrée d'une commande.  Par exemple, lancer
`cat < README` aura le même effet que de lancer `cat` puis de taper le
contenu du fichier README.

`|` (pipe) crée un "tube" de communication entre deux commandes.  On peut
l'utiliser pour combiner plusieurs commandes simples afin d'en faire quelque
chose de plus complexe, `ls | grep tmp` affichera par exemple la liste des
fichiers du dossier courrant comportant "tmp" dans leur nom. Ce concept de
communication simple entre les programmes est très utilisé dans les
environements unix et permet de réaliser très facilement des actions compliquées
à partir de plusieurs programmes simples.

## Le globbing

Le globbing est un méchanisme du shell qui permet de "sélectionner" plusieurs
fichiers en une fois.  Il s'utilise pricipalement avec `*` qui signifie
"n'importe quoi" et `{a,b,c}` qui signifie "a", "b" ou "c".  Ainsi
l'expression `*.txt` représente tous les fichiers (du dossier courant) avec
l'extension ".txt" et `gconfs.{c,h}` représente les fichiers "gconfs.c" et
"gconfs.h".

## Structures de contrôle

Comme dans un langage de programmation classique, les scripts shell peuvent
contenir des structures de controle telles que `if`, `while` ou `for`.

`if <condition>; then <cmd; cmd; …>; [else <cmd; …>;] fi`

permet d'exécuter une suite d'instructions seulement si la condition est
vérifiée (ie.  si elle renvoit 0).

`while <condition>; do <cmd; cmd; …>; done`

permet d'exécuter une suite d'instructions tant que la condition est vérifiée.

`for <variable> in <liste>; do <cmd; cmd; …>; done`

permet d'exécuter une suite d'instructions pour chaque valeur de la liste.
Cette liste peut être une simple suite de valeurs séparées d'espaces ou retours
à la ligne comme `1 2 3 nous "irons au bois"`, mais aussi un globbing (`*.c`) ou
un sous-shell (`` `ls` ``) par exemple.

## Les sous-shell

Les sous-shells permettent de remplacer un morceau d'une ligne de commande par
le résultat de son exécution (je clair Luc, ne pas ?).  Pour les utiliser il
suffit de faire `` `expression` ``.  Cette merveilleuse technologie donne lieu à des
expressions comme ``echo "Mon sous-shell a dit : `echo -n Je suis ton
sous-shell`" `` qui après expansion donne `echo "Mon sous-shell a dit : Je suis ton sous-shell"`.
