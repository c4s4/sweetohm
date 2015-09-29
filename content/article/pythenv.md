---
title:      Pythenv
date:       2015-09-29
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         pythenv
categories: [projets]
tags:       [python]
lang:       fr
toc:        
new:        true
---

Sur Github: <https://github.com/c4s4/pythenv>

Pythenv exécute un script Python dans un environnement virtuel temporaire, créé à la volée dans le répertoire */tmp*, puis détruit après usage.

<!--more-->

Usage
-----

### Utilisation d'un fichier de requirements

Vous pouvez indiquer les requirements du script dans un [fichier standard de requirements](https://pip.readthedocs.org/en/1.1/requirements.html), *requirements.txt*, comme suit :

```
foo==1.2.3
bar
```

Pour exécuter un script Python avec ces requirements on tapera :

```
$ pythenv requirements.txt script.py arg1 arg2
```

### Embarquer les requirements dans le script

Vous pouvez aussi embarquer les requirements dans le script lui-même, dans une déclaration qui est une liste, séparée par une virgule, des dépendances du script :

```python
# requirements: foo==1.2.3, bar
```

On lancera alors le script avec la commande suivante :

```
$ pythenv script.py arg1 arg2
```

Installation
------------

Pour pouvoir utiliser *pythenv* vous devez avoir installé :

- Une machine virtuelle Python (testé avec les vesion *2.7.10* et *3.5.0* de Python).
- virtualenv pour créer l'environnement virtuel (*pyvenv* sera appelé avec Python *3.3* et au-delà).
- PIP pour installer les dépendances

Pour installer *pythenv*, copier le script *pythenv* quelque part dans votre *PATH* (par exemple dans le répertoire */usr/local/bin/* ou */opt/bin/*).


Comment ça marche
-----------------

Pythenv va :

- Créer un environnement virtuel dans le répertoire */tmp*.
- Installer les dépendances dans cet environnement virtuel.
- Exécuter le script dans cet environnement virtuel.
- Effacer l'environnement virtuel temporaire.
- Renvoyer les code de retour renvoyé par me script exécuté.

Si les requirements sont embarqués dans le script, un fichier requirements temporaires sera créé dans le répertoire */tmp*, puis détruit après usage.

*Enjoy!*
