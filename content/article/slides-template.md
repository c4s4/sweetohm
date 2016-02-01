---
title:      Template Slides
date:       2015-11-11
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         slides-template
categories: [projets]
tags:       [markdown]
lang:       fr
toc:        false
new:        false
---

Sur Github: <https://github.com/c4s4/slides>

Ce projet est un template de slides. Il utilise [Remark JS](http://remarkjs.com/) et permet donc de générer des slides HTML à partir d'un texte au format [Markdown](https://fr.m.wikipedia.org/wiki/Markdown).

<!--more-->

Quoi de plus que Remark JS ?
----------------------------

Par rapport à Remark JS, ce template :

- Fournit un makefile pour insérer le markdown dans le template HTML.
- Les slides générés incluent toutes les ressources nécessaires (fichiers JavaScript, fontes et feuilles de style CSS). On peut donc faire sa présentation sans réseau.
- Le makefile permet de publier les slides par *rsync*.

Comment utiliser ce template ?
------------------------------

Pour créer un projet de slides à partir de ce template :

- Télécharger l'archive [sur Github](https://github.com/c4s4/slides/releases) et la dézipper.
- Éditer le *Makefile* pour personnaliser les propriétés suivantes :
  - `TITLE` : le titre de la présentation.
  - `DESTINATION` : la destination des slides lors de la publication par *rsync*.

Il ne reste plus qu'à éditer le contenu de la présentation dans le fichier *README.md* ! On trouvera un bref tutoriel pour écrire ces slides (sous forme de slides produits avec ce template) à [cette adresse](http://sweetohm.net/slides/slides/).

*Enjoy!*