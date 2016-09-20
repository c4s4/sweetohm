VERSION=$(shell date -I)
MESSAGE=Release $(VERSION)
SYNC_DEST=/home/web/sweetohm/
CV_DEST=/home/web/public/

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

PDF=$(patsubst content/article/%.md,public/pdf/%.pdf,$(wildcard content/article/*.md))
EPUB=$(patsubst content/article/%.md,public/epub/%.epub,$(wildcard content/article/*.md))

all: generate

init:
	@echo "$(YELLOW)Creating virtualenv$(CLEAR)"
	rm -rf venv
	virtualenv venv
	. venv/bin/activate && pip install -r requirements.txt

dirs:
	@echo "$(YELLOW)Creating directories$(CLEAR)"
	mkdir -p public/pdf public/epub

public/pdf/%.pdf: content/article/%.md
	md2pdf -i content/article -o $@ $<

public/epub/%.epub: content/article/%.md image_dir.py
	. venv/bin/activate && pandoc -t epub -o $@ --filter ./image_dir.py $<

generate: dirs $(PDF) $(EPUB)
	@echo "$(YELLOW)Generating static site$(CLEAR)"
	hugo

sync:
	@echo "$(YELLOW)Syncing website$(CLEAR)"
	rsync -av public/ ${SYNC_DEST}

update:
	@echo "$(YELLOW)Update site if changed on remote master$(CLEAR)"
	git fetch
	if [ `git rev-parse origin/master` != `git rev-parse HEAD` ]; then \
		git pull && make generate sync; \
	fi

server: dirs $(PDF) $(EPUB)
	@echo "$(YELLOW)Running development server$(CLEAR)"
	hugo server --watch

release:
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	git tag -a "$(VERSION)" -m "$(MESSAGE)"
	git push origin "$(VERSION)"

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf public/

cv:
	@echo "$(YELLOW)Generating resume$(CLEAR)"
	cp content/article/michel-casabianca.md /tmp/
	cd /tmp && \
		md2pdf michel-casabianca.md && \
		pandoc -t docx -o michel-casabianca.docx michel-casabianca.md && \
		scp michel-casabianca.pdf michel-casabianca.docx $(CV_DEST) && \
		rm michel-casabianca.md michel-casabianca.pdf michel-casabianca.docx

help:
	@echo "$(CYAN)init$(CLEAR)      Create virtualenv"
	@echo "$(CYAN)dirs$(CLEAR)      Create destination directories"
	@echo "$(CYAN)generate$(CLEAR)  Generate static site"
	@echo "$(CYAN)sync$(CLEAR)      Synchronize site with server"
	@echo "$(CYAN)server$(CLEAR)    Run development server"
	@echo "$(CYAN)release$(CLEAR)   Release project"
	@echo "$(CYAN)clean$(CLEAR)     Clean generated files"

