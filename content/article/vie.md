---
title:      Jeu de la vie
author:     Michel CASABIANCA
date:       2000-02-07
categories: [jeux]
tags:       [applet, simulation, jeu]
id:         vie
email:      casa@sweetohm.net
lang:       fr
toc:        
---

Le jeu de la vie, automate cellulaire imaginé par John Horton Conway en 1970, est probablement, à l’heure actuelle, le plus connu de tous les automates cellulaires. Malgré des règles très simples, le jeu de la vie permet le développement de motifs extrêmement complexes.

<!--more-->

Applet Java
-----------

<applet code="Vie.class" codebase="../java/vie" width="220" height="300">
<font color="red">
Si vous voyez ce texte, c'est que votre navigateur n'est 
pas compatible Java ou n'a pas &eacute;t&eacute; correctement configur&eacute;.
</font>
</applet>

### Réglages de l'applet

#### Panneau REGLES

Il est possible, dans cette applet, de paramétrer les seuils de survie
ou de mort d'une cellule :

- **Mort par isolement** détermine le nombre en deçà duquel une
  cellule meurt d'isolement. Dans le jeu de la vie original, ce seuil
  est de 1.
- **Mort par surpopulation** règle le nombre au delà duquel la cellule
  meurt étouffée. Dans le jeu de la vie, ce nombre est de 4.
- **Limite inf. naissance** fixe le nombre minimum de cellules pour
  assister à une naissance.
- **Limite sup. naissance** le nombre maximum de cellules pour une
  naissance. Dans le jeu de la vie, ces deux valeurs sont de 3.

#### Panneau TERRAIN

- **Largeur :** détermine le nombre de cases horizontal du terrain.
- **Hauteur :** le nombre de cases vertical.
- **Plateau torique :** si elle est cochée, cette option permet faire
  communiquer les extrémités du plateau : le bord gauche est adjacent
  au bord droit et celui du haut avec celui du bas.

#### Panneau HORLOGE

- **Pas à Pas :** permet d'observer précisément l'évolution des
  cellules par une pose après chaque nouvelle génération.
- **Intervalle (ms) :** permet de fixer le temps d'attente entre
  chaque génération : permet de ralentir le jeu sur une machine trop
  puissante (?). Devient inutile sur de grands plateaux du fait du
  temps de calcul important pour une génération. Ce temps d'attente s'
  ajoute au temps de calcul et d'affichage.

### LE TERRAIN

Il est possible de cliquer sur les cases pour faire apparaître une
cellule si la case est vide, ou la faire disparaître si elle est pleine.
Il est indispensable de disposer des cellules au début du jeu ! On
dispose aussi d'un certain nombre de contrôles :

- **[ \> ] :** permet de lancer le jeu. Si la simulation est en mode
  pas à pas, il faut cliquer sur ce bouton pour faire progresser le
  jeu d'une génération.
- **[ || ] :** stoppe le jeu. On peut le reprendre en cliquant sur
  **[ \> ]**.
- **Pas à pas :** si cette case est cochée, le jeu passe en mode pas à
  pas.
- **[ 0 ] :** permet de remettre le compteur à 0.
- **Compteur :** indique le numéro de la génération affichée.
- **[Vider] :** vide le terrain de toute cellule.
- **[Remplir] :** remplit le terrain de cellules. Chaque case a une
  certaine probabilité d'être garnie d'une cellule. Cette probabilité
  est paramétrable par la barre qui se trouve à droite du bouton. A
  droite de cette barre figure le pourcentage choisi.
- **[Quitter] :** permet de refermer la fenêtre du terrain. C'est
  indispensable pour changer les dimensions du terrain.

Bonnes expérimentations à tous et toutes.

Le Jeu de la Vie
----------------

Cet applet permet de visualiser les multiples configurations que peut
prendre le jeu de la vie. C'est une automate cellulaire très simple :
des cellules (points noirs) sont disposées sur un plateau quadrillé. A
chaque tour, la machine détermine si chaque cellule vit ou meurt en
suivant la règle suivante : si une cellule est entourée de 2 ou 3 autres
cellules, elle vit. si elle est entourée par 0 ou 1 autre cellule, elle
meurt de solitude. si elle est entourée par 4 cellules ou plus, elle
meurt étoffée. si une case est vide mais entourée d'exactement 3 autres
cellules, il apparaît une nouvelle cellule.

Cet automate cellulaire a été inventé par John Conway (éminent
mathématicien de Cambridge) au début des années 70, et a été populaire
au point que des journaux lui ont été consacré ! Le jeu de la vie se
prêtant parfaitement à une programmation sur ordinateur, de mauvaises
langues ont prétendu que les premiers écrans graphiques ont été conçus
pour permettre aux informaticiens de visualiser ce jeu !

Pour en savoir plus
===================

- La vie artificielle (Julio Fernandez Ostolaza et Alvaro Moreno
  Bergareche) chez Seuil / point découverte.
- La mathématique des jeux (bibliothèque "pour la science").
- Récréations informatiques (bibliothèque "pour la science").

