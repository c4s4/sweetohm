---
title:      Goactivate
date:       2018-04-09
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         projet-goactivate
categories: [projets]
tags:       [golang]
lang:       fr
toc:        false
---

Sur Github: <https://github.com/c4s4/goactivate>

Script pour définir le *PATH*, *GOPATH* et l'invite du shell pour votre projet Go.

<!--more-->

Usage
-----

Déposer ce script dans votre *PATH*. Pour activer l'environnement, aller à la racine répertoire du projet et taper :

```bash
$ source goactivate
```

Cela va définir le *PATH* à */project/home/bin:$PATH*. Et il va également définir *GOPATH* à */project/home*, de sorte que les dépendances seront installées dans votre répertoire de base du projet (dans le sous-répertoire *src*).

De plus, l'invite du shell est modifiée de manière à ce que le nom du projet actif soit indiqué entre crochets.

Pour désactiver l'environnement, taper :

```bash
$ deactivate
```

Cela restaurera les valeurs précédentes du *PATH*, du *GOPATH* et l'invite du shell.

Licence
-------

Ce script est une adaptation du script activate du projet virtualenv pour Python et utilise sa licence (dans le fichier *LICENSE.txt*).

*Enjoy!*
