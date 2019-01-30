---
title:      "Expérience Go"
author:     Michel Casabianca
date:       2018-01-22
categories: []
tags:       [cv, curriculum vitae, michel casabianca]
id:         golang
email:      casa@sweetohm.net
lang:       fr
toc:        false
---

Voici un résumé de mon expérience dans le domaine du Go. Une [version complète de mon CV est disponible ici](http://sweetohm.net/resume/resume.html).

English version [is available here](http://sweetohm.net/resume/golang.en.html).

<!--more-->

# Mise en œuvre chez Orange *(2008-04 à 2015-10)*

J'ai découvert le Go début 2014 et l'ai rapidement mis en œuvre au sein d'Orange pour la réécriture d'un serveur SMS haute-performance. Ce serveur avait été implémenté en Java, avec NIO, et était depuis deux années en débogage pour le faire passer en production.

Devant les difficultés rencontrées pour corriger le code existant, j'ai proposé de développer des POCs, en Java sans NIO et en Go, afin de faire un choix éclairé de la technologie à mettre en place. Ces versions simplifiées ont été développées en une semaine chacune et à l'issue de tables rondes, il a été décidé de partir sur la solution Go, pour des questions de simplicité de code et de performances.

Ce travail a donné lieu à une [conférence à BDX.IO](http://sweetohm.net/slides/go-retour-experience/) et aux DevDays Orange en 2014.

# Outils pour les Éditions Dalloz *(2016-09 à 2018-01)*

Au cours de l'année 2017, j'ai développé la chaîne de publication des ouvrages et encyclopédies Dalloz. En cette occasion, j'ai codé nombre d'outils en Go. En particulier, j'ai développé en Go et mis en œuvre un [outil de build appelé Néon](http://github.com/c4s4/neon) ainsi qu'un webservice REST pour la publication des ouvrages.

# Activités personnelles *(depuis 2014)*

Depuis que j'ai découvert le langage Go, il est devenu mon langage de prédilection pour mes projets personnels.

Ainsi, j'ai un [compte Github](http://github.com/c4s4) assez [actif dans le domaine du Go](http://git-awards.com/users/search?login=c4s4) :

- [Gointerfaces](https://github.com/c4s4/gointerfaces) est un programme qui télécharge les sources de Go et en extrait la liste de toutes les interfaces définies dans le langage. On peut voir le [résultat de cette extraction sur mon site](http://sweetohm.net/article/go-interfaces.html).
- [Goactivate](https://github.com/c4s4/goactivate) est un script de définition de l'environnement Go comparable à la commande *activate* du *virtualenv* Python.
- [Néon](https://github.com/c4s4/neon) est un outil de build multi-plateforme et multi-langage.
- Il y a sur mon compte Github de [nombreux autres outils écrits en Go](https://github.com/c4s4?utf8=%E2%9C%93&tab=repositories&q=&type=&language=go).
