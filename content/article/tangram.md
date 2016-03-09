---
title:      Tangram
author:     Michel CASABIANCA
date:       2004-12-27
categories: [jeux]
tags:       [applet, jeu]
id:         tangram
email:      casa@sweetohm.net
lang:       fr
toc:        
---

Le Tangram est un jeu de réflexion qui pourrait être comparé au puzzle : il s'agit de reconstituer une silhouette donnée à partir de 7 formes imposées (2 grands triangles, un moyen, 2 petits, un carré et un losange). Il peut paraitre simple à première vue, mais quelques essais suffiront à vous convaincre du contraire !

<!--more-->

On a répertorié plus de 1500 problèmes de Tangram, c'est dire que les problèmes de l'applet Java de cette page ne font qu'effleurer le sujet ! Un autre intéret de ce jeu est que l'on peut inventer d'autres figures. Mon applet permet de m'envoyer par mail vos propres problèmes, que je ne manquerai pas d'inclure !

Les origine du Tangram
----------------------

Il semblerait que le Tangram soit apparu en Chine à la fin du XIXème siècle. Sam Loyd lui a inventé des origines vieilles de 4 millénaires... Une version mystificatrice que l'on retrouve encore dans certains ouvrages consacrés aux jeux !

Applet Virtual Tangram
----------------------

<applet code="tangram.class" codebase="../java/tangram" width="650" height="390">
<p class="applet-error">Si vous voyez ce texte, c'est que votre navigateur n'est pas compatible Java ou n'a pas été correctement configuré.</p>
</applet>

Utilisation de l'Applet
-----------------------

L'utilisation de cette applet est des plus simples :

- Pour **déplacer une forme** : il suffit de cliquer sur cette forme dans la fenêtre de gauche pour la sélectionner (elle est entourée de rouge), on peut alors la mouvoir en déplaçant le curseur de la souris (le bouton toujours enfoncé). Lorsqu'on relâche le bouton de la souris, la forme est déposée à cet endroit. Il est interdit de superposer deux formes. Si deux formes se superposent à l'issu d'un déplacement, celui-ci est annulé (la forme déplacée revient à sa place d'origine).
- Pour **faire tourner une forme** : il faut la sélectionner à l'aide de la souris, puis cliquer sur un des boutons de rotation : droite signifie une rotation dans le sens des aiguilles d'une montre et gauche, une rotation dans le sens inverse (sens direct). Si deux formes se chevauchent à l'issu d'une rotation, celle-ci n'est pas effectuée.
- Choix du **problème** : on choisit le problème à résoudre à l'aide de la liste de droite. Lorsqu'on sélectionne un élément, la figure correspondante apparait dans la fenêtre en haut à droite, et le titre dans la champ de texte juste en dessous. Lorsque vous avez résolu le problème, l'ordinateur vous l'indique. Cependant, mon algorithme de reconnaissance de la position n'est pas encore parfait, et il se peut que votre solution ne soit pas reconnue. Je travaille actuellement sur un algorithme plus performant qui puisse toujours reconnaitre la solution. Ceci dit, un problème reste hautement improbable (cela ne m'est jamais arrivé pendant les tests).

Envoi de problèmes
------------------

vous pouvez m'envoyer vos figures pour qu'elles soient incluses dans la liste de problèmes de l'applet. Pour cela, rien de plus simple : placez les formes dans la configuration appropriée sur la fenêtre de gauche (de jeu). Cliquez ensuite sur le bouton **[clef]**. Il apparait alors une fenêtre vous donnant la clef de la position. Il faut m'envoyer par e-mail le titre de votre problème ainsi que cette clef.

### Astuce

pour ne pas avoir à recopier les chiffres à la main, il suffit de les sélectionner (à la souris ou au clavier avec les flêches de direction et la touche **[MAJ]** enfoncée) et de les copier dans le presse-papier (en appuyant sur **[CTRL]+[C]** sur PC). En appuyant sur les touches **[MAJ]+[INSER]** dans votre éditeur, le problème est inclus dans votre mail.

Un grand merci aux téméraires *REZO*, *Franek Hennel*, *Béa*, *Julio Alvarez*, *Grenouille*, *RICGOGO*, *Alain Delias*, *Karine Turco*, *Jennifer*, *Lucia Rotger Garcia*, *a.n.onyme*, *Olivier Capitan* et *Ivan Leprètre* (qui a envoyé pas moins de dix figures !) , *Benoit Salandre* et *Tristan Mancini* pour leurs contributions à la liste des problèmes.

Liens
-----

Vous trouverez un site très complet sur le Tangram (avec de nombreuses explications sur le jeu et des liens intéressants) à l'adresse <http://www.tangrams.ca/> (en anglais).
