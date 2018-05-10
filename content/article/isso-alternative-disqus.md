---
title:      Isso une alternative à Disqus
author:     Michel Casabianca
date:       2018-05-10
categories: [articles]
tags:       [python, disqus]
id:         isso-alternative-disqus
email:      casa@sweetohm.net
lang:       fr
toc:        false
---

Suite à des [déboires avec Disqus](/blog/171.html), je me suis mis en quête d'une alternative et je suis tombé sur [Isso](https://github.com/posativ/isso). Cet article détaille son installation sur une Debian.

<!--more-->

![Isso Pokemon](isso-alternative-disqus.png)

Isso est écrit en [Python](http://python.org), il vous faut donc une machine virtuelle Python. Il vous faudra aussi disposer de Pip, distribué avec les dernières versions de Python.

Pour installer Isso, utiliser Pip comme suit :

```
$ pip install isso
```

On pourra alors démarrer Isso avec la commande :

```
$ isso -c /etc/isso.cfg
```

Où */etc/isso.cfg* est le chemin vers le fichier de configuration Isso. Le mien ressemble à celui-ci :

```ini
; |||||||||||| general settings ||||||||||||||
[general]
;database location. automatically created if doesn't already exist
dbpath = /home/isso/comments.db

;this will be the 'X-Script-Name' we proxy server requests to [later!]
name = isso

; your website or blog [not the location of Isso]
host = http://hostname.com

; logfile. might need to create this first
log-file = /var/log/isso.log

; get notifications by email
notify = smtp

;||||||||||| server section ||||||||||
[server]
;port to listen on. choose a number you like!
listen = http://localhost:8181


;||||||||| smtp section [for notifications] |||||
[smtp]
;these are the details for the 'from' address Isso uses to send notifications
;you might want to use a dedicated email account for this
username = username@orange.fr
password = *********
host = smtp.orange.fr
port = 587
security = none

;this is the 'to' address Isso sends notification emails to
to = username@hostname.com

;from address as shown on emails. should correspond to sender account above
from = "Isso Comments" <isso@hostname.com>
timeout = 10

;|||||| guard –Isso's basic spam protection |||||||
[guard]
enabled = true
;no. of allowed comments per minute
ratelimit = 2
;no of direct replies allowed
direct-reply = 3
;can people reply to their own comments while edit window still open
reply-to-self = false
;do commenters need to leave a name
require-author = false
;do commenters need to provide an email
require-email = false

;allowed markdown in comments. [uses misaka markdown]
[markup]
;default options allow most 'unharmful' markdown
options = strikethrough, superscript, autolink
;default allowed = a, blockquote, br, code, del, em, h1, h2, h3, h4, h5, h6, hr, ins, li, ol, p, pre, strong, table, tbody, td, th, thead, ul
;allowed-elements =
;default allowed = align, href
;allowed-attributes

;creates identicons for users across isso installations
[hash]
;OK to use this salt
salt = Eech7co8Ohloopo9Ol6baimi
algorithm = pbkdf2

;comments must be moderated before publication
;NOTE: requires "notify = smtp" to be set in the [general] section
[moderation]
enabled=true
purge-after=30d
```

Il vous faudra bien sûr personnaliser ce fichier avec votre hostname et votre accès au serveur SMTP pour l'envoi des emails.

Il faut configurer un Apache ou autre serveur web pour rediriger les requêtes vers *http://hostname/isso* vers *http://localhost:8181/isso*. Pour ce faire, voici mon fichier de configuration Apache :

```html
# Apache configuration file for isso. Put this file in directory:
# /etc/apache2/sites-available. To enable this site, type:
# 
#   sudo a2ensite isso
# 
# To disable it:
# 
#   sudo a2dissite isso
# 
# Modules proxy and proxy_http must have been enabled with:
# 
#   sudo a2enmod proxy proxy_http

<Location "/isso">
    ProxyPass "http://localhost:8181"
    ProxyPassReverse "http://localhost:8181"
</Location>
```

D'autre part, pour démarrer le service au boot de la machine, il faut créer un service systemd. Voici le fichier de configuration */lib/systemd/system/isso.service* que j'utilise pour ce faire :

```ini
[Unit]
Description=Isso
After=network-online.target

[Service]
Type=simple

User=isso
Group=isso
UMask=007

ExecStart=/opt/misc/isso-0.10.5/bin/isso -c /etc/isso.cfg

Restart=on-failure

# Configures the time to wait before service is stopped forcefully.
TimeoutStopSec=300

[Install]
WantedBy=multi-user.target
```

Ce fichier indique en particulier :

- La commande pour lancer Isso, */opt/misc/isso-0.10.5/bin/isso -c /etc/isso.cfg*.
- L'utilisateur et le group sous lesquels tourne Isso, dans mon cas *isso* et *isso*.

On pourra créer l'utilisateur et son groupe avec la commande :

```
$ sudo adduser isso
```

Il faudra alors lui donner les droits sur le fichier de log avec :

```
$ sudo touch /var/log/isso.log
$ sudo chown isso: /var/log/isso.log
```

D'autre part, je stocke les données de la base Sqlite dans le répertoire */home/isso*, il faut donc le créer et donner les droits en écriture :

```
$ sudo mkdir /home/isso
$ sudo chown -R isso: /home/isso
```

On pourra alors démarrer le service isso avec la commande :

```
$ sudo systemctl start isso
```

On l'arrêtera avec :

```
$ sudo systemctl stop isso
```

Et on le lancera au boot de la machine avec :

```
$ sudo systemctl enable isso
```

De plus, j'ai dû patcher Isso *0.10.5* de manière à ce que le lien des emails pour approuver ou rejeter les commentaires soit correct. La ligne 110 du fichier *isso/ext/notifications.py* :

```python
uri = local("host") + "/id/%i" % comment["id"]
```

Doit être remplacée par :

```python
uri = local("host") + "/isso/id/%i" % comment["id"]
```

Pour finir, j'ai ajouté dans les pages où je veux activer les commentaires le code suivant :

```html
<script data-isso="{{ .Site.BaseURL }}/isso/"
        src="{{ .Site.BaseURL }}/js/isso.js"></script>
<div id="isso-thread"></div>
```

A noter que je fais servir le ficiher JS de Isso par Apache et non pas par Isso lui même (ce qui est un non-sens).

*Enjoy!*
