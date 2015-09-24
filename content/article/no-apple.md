---
title:       No Apple
author:      Michel Casabianca
email:       casa@sweetohm.net
date:        2015-03-14
id:          no-apple
categories:  [articles]
tags:        [apple, linux, debian, zotac nano ci320, acer c720]
lang:        fr
toc:         true
---

Mon *MacBook Pro* ayant eu quelques soucis, je me suis mis en quête d'une machine de bureau pour le remplacer. Je me suis décidé à ne pas repartir sur du matériel Apple pour les raisons suivantes :

- Des prix délirants : j'avais payé mon *MacBook Pro* *2400 €* il y a 8 ans !
- Une politique de plus en plus insupportable en terme de hardware : batteries collées, vis spéciales, etc.
- Une qualité du matériel en baisse : j'ai dû [changer la carte mère de mon Mac](http://sweetohm.net/blog/95.html) au bout de 4 ans pour la modique somme de *450 €*.

Cet article décrit ma solution de remplacement tant en terme logiciel que de matériel.

<!--more-->

Logiciels
=========

J'utilisais sur mon Mac deux logiciels spécifiques Apple : iPhoto et iTunes. Ces deux logiciels n'ont pas posé de problème majeur lors de la migration car ils utilisent des formats ouverts et faciles à exploiter : fichiers image ou audio dans une arborescence de répertoires accompagnés de fichiers XML pour les méta-données, comme les playlist d'iTunes et les albums photo de iPhoto.

iPhoto
------

J'ai décidé de migrer les données iPhoto vers un format simple et exploitable sur toute plateforme et par tout logiciel :

- Les photos sont conservées au format original de l'appareil ou téléphone qui les a prises.
- Elles sont groupées dans des répertoires par année et des sous répertoires ayant pour nom la date puis l'événement (par exemple *2015-06-17 Mariage* pour les photos d'un mariage le 17 juin 2015).

Dans iPhoto, les photos sont réparties dans des répertoires par année. Les événements sont listés dans des fichiers XML d'iPhoto.

J'ai donc cherché un script capable d'effectuer cette transformation. J'ai fini par sélectionner [exportiphoto](https://github.com/BMorearty/exportiphoto). Il fonctionne plutôt bien mais :

- Je n'ai pas réussi à installer la bibliothèque permettant de parser les méta-données.
- Il gère mal les encodages (donc problème avec les noms des événements comportant des accents).

Autres solutions envisagées :

- phoshare : <https://code.google.com/p/phoshare/>.
- iPhoto to Disk (12 $) : <http://www.iphototodisk.com/>.
- iPhoto vers Shotwell : <https://github.com/fasaxc/shotwell-iphoto-import>.

J'ai donc trouvé mon bonheur avec *exportiphoto*. Je distribue maintenant les photos par *DLNA* sur la télé familiale. On n'y perd pas au change par rapport aux photos sur le Mac : il est plus agréable de se faire une séance photos en famille sur le canapé devant le grand écran de la TV plutôt qu'au bureau devant un Mac.

iTunes
------

J'ai simplement eu à nettoyer le répertoire iTunes pour ne laisser que les morceaux classées dans des répertoires pour les artistes et des sous-répertoires pour les albums.

J'ai utilisé *requiem 4.1* pour virer les DRMs des morceaux de musique achetés sur iTunes avant qu'ils ne les abandonnent. Apple m'avait pourtant gentiment proposé [de racheter mes morceaux sans DRM](http://sweetohm.net/blog/28.html) pour la somme symbolique de *99,41 €*. Je suppose que c'est pour me remercier d'avoir acheté plus de *3.000* morceaux sur leur store...

Cette musique est maintenant dans mon *Galaxy Note* mais aussi distribuée sur le réseau familial par *DLNA*. J'envisage de mettre un Raspberry Pi équipé d'un DAC derrière ma chaîne pour avoir un rendu de qualité dans le salon.

Hardware
========

Pour commencer, j'ai préféré partir sur une machine de bureau plutôt qu'un portable grand écran. Je préfère le confort d'un clavier 102 touches, d'une vraie souris et d'un moniteur grand format de qualité.

D'autre part, j'avais apprécié le silence, la basse température, la basse consommation et la puissance de mon portable ([un Acer C720P sous Debian](http://sweetohm.net/article/debian-jessie-zotac-nano-ci320.html)) qui embarque un processeur Celeron.

Je me suis donc intéressé aux mini-PC. Plus particulièrement, aux machines NUC d'Intel, les machines Gigabyte et Zotac. J'ai écarté les machines de type [Raspberry Pi](http://sweetohm.net/article/raspi-un-an.html) pour des raisons de puissance CPU.

Page barebones sur LDLC : <http://www.ldlc.com/informatique/ordinateur-de-bureau/barebone-pc/c4247/p1e48t3o0a1.html>

Intel NUC Celeron 2820
----------------------

- Machine : <https://www-ssl.intel.com/content/www/fr/fr/nuc/nuc-board-dn2820fykh.html>
- Processeur : <http://www.cpubenchmark.net/cpu.php?cpu=Intel+Celeron+N2820+%40+2.13GHz>

Il semble que ces machines souffrent d'un BIOS moisi qu'il faut mettre à jour à l'installation sans quoi on ne peut installer Linux. D'autre part, ces machines sont aussi handicapées par un processeur Intel bogué en ce qui concerne l'USB.

Acheter le modèle *SAH22962-103* équipé d'un processeur *N2830* qui corrige des problèmes d'USB. Sur l'étiquette, *H22962-xxx* pour les versions en *N2820* & *H24582-xxx* pour celles en *N2830*. Source Intel : *N2820* version: *SA H22962-100*, *H22962-101*, et *H22962-102* et *N2830* sur les modèles *SA H22962-103* et plus tardifs.

Installation Debian :

- <https://communities.intel.com/message/234133>
- <http://forums.debian.net/viewtopic.php?f=17&t=112867>
- <http://www.amazon.com/gp/aw/reviews/B00HVKLSVC?thankYou=1418148802>

Bref, carton rouge pour Intel, d'autant plus qu'ils n'ont pas de machine fanless (sans ventilateur, refroidi par dissipation thermique).

Gigabyte Celeron 2955U
----------------------

- Machine : <http://www.gigabyte.fr/products/product-page.aspx?pid=4860>
- Processeur : <http://www.cpubenchmark.net/cpu.php?cpu=Intel+Celeron+2955U+%40+1.40GHz>

Zotac ZBOX BI320
----------------

- Machine : <http://www.zotac.com/products/mini-pcs/product/mini-pcs/detail/zbox-bi320.html>
- Processeur : <http://www.cpubenchmark.net/cpu.php?cpu=Intel+Celeron+2957U+%40+1.40GHz>

Zotac ZBOX Nano CI320
---------------------

- Machine : <http://www.zotac.com/products/mini-pcs/zbox-c-series/product/zbox-c-series/detail/zbox-ci320-nano.html>
- Processeur : <http://www.cpubenchmark.net/cpu.php?cpu=Intel+Celeron+N2930+%40+1.83GHz>

Cette machine bénéficie d'un processeur à quatre coeurs et refroidi par dissipation thermique. Si on l'équipe d'un disque dur SSD, on a alors une machine sans pièce mobile et parfaitement silencieuse.

Tableau récapitulatif
---------------------

Voici un tableau qui récapitule les caractéristiques des machines considérées. La colonne *Rapport* est une évaluation du rapport *puissance* divisée par le *prix* et la *consommation*. C'est donc le résultat de la formule :

                puissance
    rapport = --------------
               conso x prix

Ce qui donne le tableau suivant :

Machine                | Processeur    | Benchmark | Consommation | Debian | Prix | Rapport
---------------------- | ------------- | --------: | -----------: | :----: | ---: | ------:
Intel NUC Celeron 2820 | Celeron N2820 | 1003      | 7.5 W        | -      | 125  | 1.07
Gigabyte Celeron 2955U | Celeron 2955U | 1517      | 15 W         | ?      | 135  | 0.75
Zotac ZBOX BI320       | Celeron 2957U | 1508      | 15 W         | ?      | 109  | 0.92
Zotac ZBOX Nano CI320  | Celeron N2930 | 1709      | 7.5 W        | +      | 155  | 1.47

Conclusion
----------

J'ai sélectionné le *Zotac nano CI320* pour le bon compromis entre puissance, faible consommation et prix. D'autre part, avoir une machine minuscule et parfaitement silencieuse sur le bureau est un plaisir. Pour finir, [la prise en charge de Linux est bonne](http://sweetohm.net/article/debian-jessie-zotac-nano-ci320.html).

Moniteur
========

- Guide lesnumériques : <http://www.lesnumeriques.com/moniteur-ecran-lcd/guide-achat-meilleurs-moniteurs-ecrans-lcd-a899.html>
- Acheté Iiyama ProLite E2283HS-B1 (en promotion à la FNAC) : <http://www.iiyama.com/fr_fr/produits/prolite-e2283hs-1/376,prolite-e2283hs-b1.pdf>

Bon moniteur. Mon seul reproche est que le pied est peu orientable (l'amplitude est très faible).
