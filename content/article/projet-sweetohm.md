---
title:      Sweetohm
date:       2018-04-12
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         projet-sweetohm
categories: [projets]
tags:       [golang, hugo, markdown]
lang:       fr
toc:        false
---

Sur Github: <https://github.com/c4s4/continuum>

Ce projet constient les sources de mon site web. Il est généré à partir de sources [au format Markdown](https://fr.wikipedia.org/wiki/Markdown) avec le [générateur de site statique Hugo](https://gohugo.io/). Le site est responsive grâce à la [bibliothèque HTML, CSS et JS Bootstrap](https://getbootstrap.com/).

Un cron déclenche un build toutes les 5 minutes. Ce build réalise les étapes suivantes :

- Il examine le repository local avec le distant.
- Si le repository local n'est à jour, on arrête le build.
- On génère les PDF, Epub et Docx des documents ayant changé.
- On finit par générer les pages HTML du site avec Hugo.

La génération du site avec Hugo met moins d'une seconde !

Le build du site est réalisé avec [mon outil de build NeON](http://github.com/c4c4/neon).

*Enjoy!*
