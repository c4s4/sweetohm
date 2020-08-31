---
title:      Aide Mémoire Git
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         aide-memoire-git
date:       2020-08-31
categories: [git]
lang:       fr
toc:
---

Voici un petit aide mémoire pour Git.

<!--more-->

# Initialisation

Pour initialiser un repository Git :

```
$ git init
$ git add *
$ git commit -m "Initial import"
```

Il peut être utile d'ajouter un fichier *.gitignore* afin d'ignorer certains fichiers dans Git.

# Commiter

Lorsqu'on veut commiter son travail sur un fichier :

```
$ git add my-file
$ git commit -m "Commit message" my-file
```

Pour envoyer les modifications sur le repository :

```
$ git push
```

Pour récupérer les modifications du repository :

```
$ git pull --rebase
```

# Branches

Pour lister les branches en local :

```
$ git branch
```

Pour lister aussi celles du repository :

```
$ git branch -a
```

Pour se placer sur une branche (en local ou sur le repository) :

```
$ git checkout my-branch
```

Pour créer une branche :

```
$ git branch my-branch
```

Pour créer une branche et se placer dessus :

```
$ git checkout -b my-branch
```

Pour effacer une branche :

```
$ git branch -d branch-to-delete
```

Parfois Git se plaint (souvent à tord) que la branche que l'on veut effacer n'a pas été mergée, dans ce cas on pourra l'effacer avec :

```
$ git branch -D branch-to-delete
```

Pour pousser une branche vers le repository :

```
$ git push -u my-branch origin
```

Pour effacer une branche en local et dans le repository :

```
$ git branch -d branch-to-delete
$ git push origin --delete branch-to-delete
$ git fetch --all --prune
```

Pour renommer une branche :

```
$ git branch -m old-branch new-branch
```

Pour renommer une branche en local et dans le repository :

```
$ git branch -m old-branch new-branch
$ git push origin :old-branch
$ git push --set-upstream origin new-branch
```

# Tags

Pour créer un tag :

```
$ git tag my-tag
```

Pour effacer un tag :

```
$ git tag -d my-tag
```

Pour effacer un tag en local et sur le repository :

```
$ git tag -d foo
$ git push origin :refs/tags/foo
```

Pour se placer sur le tag :

```
$ git checkout tag-name
```

# Créer un repo

Pour ajouter un projet GIT existant à un répository :

- Effacer l'origine du projet :

    ```
    $ cd my-project
    $ git remote rm origin
    ```

- Faire un clone bare du projet :

    ```
    $ cd ..
    $ git clone --bare my-project
    ```

Cela va créer un répertoire *my-project.git* à placer dans le répertoire du repository.
