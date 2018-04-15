---
title:      GO Interfaces
author:     Michel Casabianca
date:       2014-10-29
categories: [projets]
tags:       [golang]
id:         projet-gointerfaces
email:      michel.casabianca@gmail.com
lang:       fr
toc:        no
---

Ce projet [est sur Github](https://github.com/c4s4/gointerfaces).

Ce programme liste toutes les interfaces publiques du GO. Pour le lancer, taper la commande suivante :

```bash
go run gointerfaces.go <versions>
```

<!--more-->

Où *\<versions\>* est la liste des versions de GO, par exemple *1.0.3 1.1.2 1.2.2 1.3.3 1.4.2 1.5.1*.

Cela compile et lance le programme qui va :

- Télécharger les sources de GO.
- Parser tous les fichiers sources.
- Extraire toutes les déclarations des interfaces pour les versions de GO.
- Les affiche sur la console sous la forme d'une tableau markdown.

Pour afficher le résult au format HTML, on pourra envoyer le résultat à *pandoc*:

```bash
go run gointerfaces.go 1.4.1 | pandoc -f markdown -t html
```

Vous pouvez vous le résultat sur cette page <http://sweetohm.net/article/go-interfaces.html>.

*Enjoy!*
