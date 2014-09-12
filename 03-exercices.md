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


# Exercices

## Navigation

Nous allons commencer par créer un dossier `GConfs`:
\begin{itemize}
\item Allez dans le dossier \texttt{Documents}. \hfill \texttt{ls,cd}
\item Créez un nouveau dossier nommé \texttt{GConfs}. \hfill \texttt{mkdir}
\end{itemize}\vspace{1em}

Faisons un Test.:
\begin{itemize}
\item Créez un nouveau fichier nommé \texttt{toto.txt} \hfill \texttt{touch}
\item Ecrivez "toto" dans le fichier toto.txt. \hfill `>,echo`
\end{itemize}\vspace{1em}

Nous voulons maintenant vérifier si "toto" est bien dans le fichier toto.txt:
\begin{itemize}
\item Affichez le contenu de toto.txt sur la sortie standard. \hfill `cat`
\end{itemize}\vspace{1em}

Nous avons ici utilisé une redirection afin d'écrire dans toto.txt, nous voulons maintenant faire quelque chose d'un peu plus intéressant, par exemple afficher le contenu d'un dossier et écrire ce dernier dans toto.txt, nous allons faire ça sur votre home:
\begin{itemize}
\item Nous pouvons faire un simple cd afin de revenir sur le home, mais les restrictions budgétaires nous obligent à réduire notre nombre de commandes au minimum.
\item Affichez le contenu du home à la fin du fichier toto.txt sans bouger du dossier où vous êtes. \hfill \texttt{ls}, \texttt{\~}, \texttt{>>}
\end{itemize}\vspace{1em}

Nous allons maintenant voir comment déplacer et supprimer des fichiers:
\begin{itemize}
\item Créez un nouveau dossier nommé foo/.
\item Copiez toto.txt dans foo/. \hfill `cp`
\item Allez dans foo/.
\item Changez le nom de toto.txt en tata.txt. \hfill `mv`
\item Déplacez tata.txt dans le dossier gconfs. \hfill `mv`
\item Remarque: on aurait pu faire les deux dernière instruction en même temps: `mv toto.txt ../tata.txt`
\item Déplacez vous sur gconfs. \hfill `..`
\item Supprimez le dossier foo et toto.txt. \hfill `rm`
\item Créez les dossiers je/peux/pas/gconfs en une seul ligne de commande et allez dans le dossier peux/. \hfill `mkdir`
\item Retournez dans gconfs/ sans taper "gconfs". \hfill `cd`
\end{itemize}\vspace{1em}

\subsection{Commandes et options utiles}
\begin{itemize}
\item Affichez le nombre de lignes d'un fichier. \hfill `wc`
\item Affichez le nombre de mots de chaque fichier .c et .h d'un dossier. \hfill `globbing, wc`
\item Affichez le nombre d'occurences de "gconfs" dans un fichier. \hfill `grep`
  \begin{itemize}
  \item Même chose avec la homepage de gconfs.fr. \hfill `curl, wget`
  \end{itemize}
\item Affichez l'arborescence d'un dossier \hfill `tree`
  \begin{itemize}
  \item Montrez leurs permissions avec une option de la même commande.
  \end{itemize}
\item Créez les dossiers ~/1/2/3/4/…/1337/. \hfill `script`
\item Trouvez tous les .jpg de votre home. \hfill `find`
\item Trouvez le chemin absolu du binaire git. \hfill `which`
\item Remplacez tous les nombres d'un fichier par -<nombre>. \hfill `sed`
\item Créez le script \texttt{dettes.sh} qui s'utilise comme ceci \texttt{dettes.sh 42 69 1337} et affiche "Je dois $<$somme$>$ euros.".
  \begin{itemize}
  \item Remplacez "Je dois" par "Bruce me doit". \hfill `|, sed`
  \end{itemize}
\item My Little Confloose, retournez votre écran (puis remettez-le à l'endroit, ça peut servir) \hfill `xrandr`
  \begin{itemize}
  \item Trouvez d'autres moyens de faire comprendre à vos camarades qu'il faut se locker en SM.
  \end{itemize}
%\item Testez des dispositions de clavier un peu plus sympa (us intl, fr oss, bépo, dvorak) \hfill `setxkbmap`
%  \begin{itemize}
%  \item Exercice : tapez "Ça et là", "Œuf dur", "© login_x", "ÉPÎTÀ".
%  \end{itemize}
\end{itemize}

\end{document}
