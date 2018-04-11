---
title:      Continuum
date:       2018-04-11
author:     Michel Casabianca
email:      casa@sweetohm.net
id:         projet-continuum
categories: [projets]
tags:       [golang]
lang:       fr
toc:        false
---

Sur Github: <https://github.com/c4s4/continuum>

Continuum est un outil d'intégration continue léger: pas d'interface web, pas de planificateur. Il s'exécute sur la ligne de commande et est déclenché par cron.

<!--more-->

Installation
------------

Déposez l'exécutable de votre plateforme *continuum_os_arch*, dans le répertoire *bin* de l'archive de distribution, quelque part dans votre *PATH* et renommez-le *continuum*. Par exemple, sur Linux 64 bits, vous devez copier *continuum_linux_amd64* vers */usr/local/bin/continuum*.

Configuration
-------------

La configuration est au format YAML :

```yaml
directory: /tmp
status:    /tmp/continuum-status.yml
port:      6666
email:
  smtp-host: smtp.nowhere.com:25
  recipient: nobody@nowhere.com
  sender:    nobody@nowhere.com
  success:   true
  once:      true
modules:
  - name:    Continuum
    url:     https://github.com/c4s4/continuum.git
    branch:  develop
    command: |
      set -e
      make test
```

La première partie indique:

- **directory** : le répertoire où les modules seront extraits. Actuellement, seuls les projets GIT sont pris en charge.
- **status** : c'est le nom du fichier où sont stockés les status des modules (pour déterminer si leur référentiel a changé depuis la dernière exécution et si le dernier build était un succès ou un échec).
- **port** : le port que *continuum* écoute pour s'assurer qu'une seule instance est en cours d'exécution à la fois. Ce port devrait être libre sur la machine hôte.
- **email** : mettez *~* si vous ne souahitez recevoir aucune email.

Si vous attendez de recevoir des rapports par courrier électronique, fournissez les champs suivants:

- **smtp-host** : le nom d'hôte et le port de votre serveur SMTP.
- **recipient** : l'email du destinataire du rapport de construction.
- **sender** : l'adresse email de l'expéditeur du rapport.
- **success** : indique si continuum devrait envoyer un email en cas de succès. Si *false*, il enverra seulement un email si le build est en erreur.
- **once** : si vous voulez envoyer un seul email lors du changement de statut d'un module.
   changements.

La deuxième partie est constituée de la liste des modules, avec, pour chaque module:

- **name** : le nom du module.
- **url** : l'URL du module que GIT utilisera pour obtenir les sources.
- **branch** : la branche à construire (comme *master* ou *develop* par exemple).
- **command** : le script bash pour exécuter les tests, qui doit renvoyer *0* en cas de succès et une valeur différente en cas d'erreur (comme n'importe quel script Unix devrait le faire).

Vous pouvez passer le fichier de configuration à utiliser sur la ligne de commande. Si vous ne passez pas le fichier de configuration sur la ligne de commande, continuum recherchera les fichiers suivants :

- *~/.continuum.yml*
- */etc/gontinumm.yml*

Crontab
-------

Ce script est déclenché en utilisant cron, avec une configuration comme suit (dans le fichier */etc/cron.d/continuum*) :

```bash
# /etc/cron.d/continuum
# cron configuration to run gontinuum

SHELL=/bin/sh
PATH=/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=""

# run continuum every 15 minutes
*/15 * * * *    user    continuum >> /tmp/continuum.log
```

Cela lancera continuum toutes les 15 minutes. Lorsque le continuum commence, il vérifie si le référentiel a changé pour tous les modules, en comparant son hachage avec celui stocké dans le fichier *status*.

Si le référentiel a changé, *continuum* le clone et exécute la commande pour les tests. Si le script renvoie *0* (qui est la norme Unix pour dire qu'une commande a réussi), le test est OK, sinon c'est un échec.

Continuum affiche un résumé des résultats des tests et envoie un e-mail (ou non en fonction des paramètres de configuration de la messagerie) pour chaque test. La configuration email recommandée est de définir *success* et *once* à *true*. Cela enverra un email quand le statut d'un module change (donc si un build qui était en erreur réussit ou inversement).

*Enjoy!*
