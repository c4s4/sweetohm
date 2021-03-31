---
title:      Aide Mémoire Git pour Débutant
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         aide-memoire-git-debutant
date:       2021-03-31
categories: [git]
lang:       fr
toc:
---

Ce document présente les commandes Git indispensables pour un débutant ainsi que celles à éviter.

<!--more-->

## Commandes indispensables

### Initialisation

Pour cloner un repository :

```
$ git clone url-de-mon-repo [repertoire]
```

Pour initialiser un repository Git :

```
$ git init
$ git add *
$ git commit -m "Initial import"
```

Il peut être utile d’ajouter un fichier .gitignore afin d’ignorer certains fichiers dans Git.

### Commiter

Lorsqu’on veut commiter son travail sur un fichier :

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

### Revert

Pour faire un revert du dernier commit :

```
$ git revert HEAD~1
```

Pour faire un revert d’un commit en particulier *cafebabe* :

```
$ git revert cafebabe
```

Ne **PAS FAIRE DE RESET** lorsqu'on débute avec Git.

### Branches

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

Parfois Git se plaint (souvent à tord) que la branche que l’on veut effacer n’a pas été mergée, dans ce cas on pourra l’effacer avec :

```
$ git branch -D branch-to-delete
```

Pour pousser une branche vers le repository :

```
$ git push -u my-branch origin
```

### Fusion

Pour fusionner plusieurs commits, la meilleure façon est de le faire lors du merge d’une branche. Par exemple, pour merger le branche *foo* sur *master* en squashant les commits en un seul :

```
$ git checkout master
$ git pull
$ git merge --squash foo
$ git commit
$ git push origin master
```

Ceci présente l’avantage de ne pas modifier l’historique.

Ne **PAS FAIRE DE REBASE** lorsqu'on débute avec Git.

## Commandes interdites

Les commandes suivantes sont à éviter lorsqu'on débute avec Git :

- **reset** pour effacer un commit (on le remplacera par *revert*)
- **rebase** pour récupérer des modifications (on le remplacera par *merge*)
- **push -f** ou **push --force** pour forcer l'envoi au repository (ça veut dire qu’on a raté quelque chose...)

Ces commandes modifient l'historique et peuvent provoquer des pertes de données définitives (elle ne peuvent être annulées).
