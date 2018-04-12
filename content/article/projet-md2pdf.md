---
title:      Md2pdf
date:       2018-04-12
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         projet-md2pdf
categories: [projets]
tags:       [golang]
lang:       fr
toc:        false
---

Sur Github: <https://github.com/c4s4/md2pdf>

Md2Pdf est un outil pour convertir des documents [Markdown](https://en.wikipedia.org/wiki/Markdown) en PDF, sans passer par LaTeX.

Installation
------------

Télécharger l'archive sur [la page des releases](https://github.com/c4s4/md2pdf/releases). Décompressez-le et placez le binaire de votre plate-forme quelque part dans votre *PATH* (dans le répertoire */usr/local/bin* par exemple).

Cet outil appelle *htmldoc*, *xsltproc* et *faketime* en ligne de commande, il vous faut donc les installer avec *md2pdf*. Pour installer ces dépendances sous une distribution Linux comme Debian, vous pouvez taper les commandes suivantes :

```bash
sudo apt-get install xsltproc
sudo apt-get install htmldoc
sudo apt-get install faketime
```

Usage
-----

Pour obtenir de l'aide pour cet outil, taper la commande :

```bash
$ md2pdf -h
md2pdf [-h] [-x] [-s] [-t] [-i dir] [-o file] file.md
Transform a given Markdown file into PDF.
-h        To print this help page.
-x        Print intermediate XHTML output.
-s        Print stylesheet used for transformation.
-t        Print html output.
-i dir    To indicate image directory.
-o file   The name of the file to output.
file.md   The markdown file to convert.
Note:
This program calls pandoc, xsltproc and htmldoc that must have been installed.
```

Cet outil transforme l'entrée Markdown en XHTML en utilisant la bibliothèque *blackfriday*. C'st le fichier affiché avec l'option `-x`. Ce fichier est ensuite transformé en appelant *xsltproc* et la feuille de style affichée par l'option `-s`, dans un fichier XHTML intermédiaire décoré, que l'on peut afficher avec l'option `-t`. Ce fichier est à son tour transformé en PDF en appelant *htmldoc*.

L'option `-d dir` indique dans quel répertoire se trouvent les images (par rapport au répertoire courant).

Cela imprimera le document PDF résultant dans un fichier avec le même chemin que le document markdown d'origine avec l'extension *.pdf*. Pour écrire le PDF dans un autre fichier, utilisez l'option `-o file`.

Syntaxe Markdown
----------------

Voir le fichier *test/example.md* pour un exemple d'éléments de syntaxe pris en charge. C'est la syntaxe décrite sur [la page wiki markdown](http://en.wikipedia.org/wiki/Markdown), plus des images avec la syntaxe suivante:

```md
![Image Title](image_file.jpg)
```

De plus, cet outil analyse l'en-tête *YAML* au début du document, tel qu'utilisé par l'outil *pandoc*, par exemple :

```yaml
---
title:    Document title
author:   Michel Casabianca
date:     2014-06-09
email:    michel.casabianca@gmail.com
id:       1
lang:     en
toc:      true
---
```

Ces en-têtes sont utilisés par les outils pour afficher des informations au début du document et dans le pied de page:

- **title**: est le titre document.
- **auhtor**: est l'auteur du document.
- **date**: est la date de production du document au format ISO.
- **email**: est l'adresse email de l'auteur du document.
- **id**: est un identifiant unique du document (pour usage interne du générateur de mon site).
- **lang**: est la langue du document, au format ISO (a la valeur par défaut *en*).
- **toc**: indique on souhaite une table des matières dans le document résultant (*false* par défaut).

A noter que ces en-têtes ne sont pas obligatoire.

Bugs
----

### Listes successives

Si une liste ordonnée suit une liste non ordonnée, il en résulte une seule liste non ordonnée :

```yaml
- First unordered.
- Second unordered.
- Third unordered.

1. First ordered.
2. Second ordered.
3. Third ordered.
```

Le rendu est correct si un paragraphe se trouve entre les deux listes :

```yaml
- First unordered.
- Second unordered.
- Third unordered.

Test.

1. First ordered.
2. Second ordered.
3. Third ordered.
```

*Enjoy!*
