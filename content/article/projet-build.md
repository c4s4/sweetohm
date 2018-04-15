---
title:      Build
author:     Michel Casabianca
date:       2018-04-15
categories: [projets]
tags:       [java, python, golang]
id:         projet-build
email:      michel.casabianca@gmail.com
lang:       fr
toc:        yes
---

Sur Github: <https://github.com/c4s4/build>

Ce projet contient mes build files parent pour NeON.

<!--more-->

Installation
------------

Pour les installer dans votre repository NeON, tapez :

```bash
$ neon -install c4s4/build
```

Cela va sortir le projet dans le répertoire *~/.neon/c4s4/build*, sur la branche par défaut
qui est *master*.

Utilisation d'une branche
-------------------------

Pour utiliser une autre branche, telle que *develop*, allez dans le répertoire d'installation et tapez :

```bash
$ git checkout develop
```

Pour mettre à jour votre version, allez dans le répertoire d'installation et tapez :

```bash
$ git pull
```

Utilisation de releases
-----------------------

Pour utiliser une version donnée *x.y.z*, allez dans le répertoire d'installation et tapez :

```bash
$ git checkout x.y.z
```

*Enjoy!*
