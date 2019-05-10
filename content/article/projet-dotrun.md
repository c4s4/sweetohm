---
title:      Dotrun
author:     Michel Casabianca
date:       2019-05-05
categories: [projets]
tags:       [golang]
id:         projet-dotrun
email:      michel.casabianca@gmail.com
lang:       fr
toc:        yes
---

Dotrun est un outil qui permet d'exécuter une commande dans un environnement chargé d'un fichier dotenv.

- Sur Github: <https://github.com/c4s4/dotrun>
- Téléchargements : <https://github.com/c4s4/dotrun/releases>

<!--more-->

## Installation

Placer le binaire, pour votre plateforme, du répertoire *bin* de l'archive quelque part dans votre *PATH* et renommez le en *dotrun*.

## Usage

Pour lancer la commande *foo* dans l'environnement défini dans le fichier *.env* du répertoire courant, taper la commande :

```bash
$ dotrun foo args...
```

Le fichier *.env* peut définir un environnement de la manière suivante :

```bash
FOO=BAR
SPAM=EGGS
```

La commande *foo* pourra alors accéder aux variables d'environnement définies dans le fichier *.env*.

On peut aussi spécifier un autre fichier d'environnement avec l'option *-env* :

```bash
$ dotrun -env /etc/foo.env foo args...
```

De cette manière, *dotrun* ne chargera pas l'environnement depuis le fichier *.env* du répertoire courant, mais depuis le fichier indiqué.

*Enjoy!*
