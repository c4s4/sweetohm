---
title:      "Go Experience"
author:     Michel Casabianca
date:       2018-01-27
categories: []
tags:       [cv, curriculum vitae, michel casabianca]
id:         golang
email:      casa@sweetohm.net
lang:       en
toc:        false
---

Here is a summary of my experience in the field of Go. A [full version of my resume is available here] (http://sweetohm.net/resume/resume.en.html).

Une version en Français [est disponible ici](http://sweetohm.net/resume/golang.html).

<!-- more -->

# Implementation at Orange *(2008-04 to 2015-10)*

I discovered Go in early 2014 and quickly implemented it within Orange for the rewrite of a high-performance SMS server. This server had been implemented in Java, with NIO, and had been debugging for two years to make it go into production.

Faced with the difficulties encountered in correcting the existing code, I proposed to develop POCs, in Java without NIO and Go, in order to make an informed choice of the technology to set up. These simplified versions were developed in one week each and at the end of round tables, it was decided to go on the Go solution, for simplicity of code and performances.

This work resulted in a [talk at BDX.IO (in french)] (http://sweetohm.net/slides/go-retour-experience/) and the Orange DevDays in 2014.

# Tools for Dalloz Publishing *(2016-09 to 2018-01)*

During the year 2017, I developed the publishing chain of Dalloz books and encyclopedias. On this occasion, I coded many tools in Go. In particular, I developed a [build tool called Neon] (http://github.com/c4s4/neon), a REST webservice for books publication and many publishing tools.

# Tools for MieuxPlacer.com *(2018-03 to 2019-09)*

At <http://mieuxplacer.com>, I have used Go to write scripts to call webservices and batches to updates economic data. The performance improvement was spectacular.

I also have organized a Go and TDD workshop.

# Webservice at OVH *(2019-11 à 2020-05)*

Developement of a high performance webservice to log deprecated code. Can process more than 8,000 requests per second and record calls in a PostgreSQL database.

# Personal activities *(since 2014)*

Since I discovered the Go programming language, it has become my favorite for personal projects.

So, I have a [Github account] (http://github.com/c4s4) that is pretty [active in the Go domain] (http://git-awards.com/users/search?login=c4s4):

- [Neon] (https://github.com/c4s4/neon) is a multi-platform and multi-language build tool.
- [Gointerfaces] (https://github.com/c4s4/gointerfaces) is a program that downloads Go sources and extracts a list of all interfaces defined in the language. We can see the [result of this extraction on my site] (http://sweetohm.net/article/go-interfaces.html).
- [Goactivate] (https://github.com/c4s4/goactivate) is a script for setting the Go environment comparable to the *activate* command of *virtualenv* Python.
- [Single](https://github.com/c4s4/single) is a tools that ensures that a single instance af an application is running on a server.
- [Dotrun](https://github.com/c4s4/dotrun) runs a command in an environment loaded from a dotenv file.
- There are [many other tools written in Go on my Github account] (https://github.com/c4s4?utf8=%E2%9C%93&tab=repositories&q=&type=&language=go).
