## Variables d'environnement

### Les variables utiles

    \$HOME, \$OLDPWD, \$EDITOR, \$PATH
\$HOME est la variable contenant le chemin absolu vers le dossier home de
l'utilisateur. Par exemple /root/ pour l'utilisateur 'root' et /home/user/
pour l'utilisateur 'user'.

Comme vu précédemment, la commande 'pwd' affiche le chemin absolu du dossier
courant. \$OLDPWD est la variable qui sert à contenir le chemin absolu vers
l'ancien dossier courant.

\$EDITOR défini l'éditeur par défaut du système. Quand un programme a besoin
d'un éditeur, il lance celui dont le nom est contenu dans la variable \$EDITOR

La variable \$PATH est probablement la variable la plus importante, elle
contient une suite de chemins absolus séparé par des ":". Ce sont les chemins
vers les binaires des programmes. Elle sert à indiquer au système où aller
chercher les programmes pour les executer. Sans cette variable, aucun
programme ne peut être lancé. Vous ne pourrez plus rien faire si cette
variable est remplacée par autre chose.

### Modifier une variable d'environnement
export MAVARIABLE=valeur

exemple : export EDITOR=vim
