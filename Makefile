VERSION=$(shell date -I)
BUILD_DIR=build
MESSAGE=Release $(VERSION)
DESTINATION=/home/web/sweetohm
CV_DESTS=casa@sweetohm.org:/home/web/sweetohm casa@sweetohm.net:/home/web/sweetohm

YELLOW=\033[1m\033[93m
CYAN=\033[1m\033[96m
CLEAR=\033[0m

PDF=$(patsubst content/article/%.md,$(BUILD_DIR)/pdf/%.pdf,$(wildcard content/article/*.md))
EPUB=$(patsubst content/article/%.md,$(BUILD_DIR)/epub/%.epub,$(wildcard content/article/*.md))

all: generate

init:
	@echo "$(YELLOW)Creating virtualenv$(CLEAR)"
	rm -rf venv
	virtualenv venv
	. venv/bin/activate && pip install -r requirements.txt

dirs:
	@echo "$(YELLOW)Creating directories$(CLEAR)"
	mkdir -p $(BUILD_DIR)/pdf $(BUILD_DIR)/epub

$(BUILD_DIR)/pdf/%.pdf: content/article/%.md
	md2pdf -i content/article -o $@ $<

$(BUILD_DIR)/epub/%.epub: content/article/%.md image_dir.py
	. venv/bin/activate && pandoc -t epub -o $@ --filter ./image_dir.py $<

generate: dirs $(PDF) $(EPUB)
	@echo "$(YELLOW)Generating static site$(CLEAR)"
	hugo -d $(BUILD_DIR)

sync:
	@echo "$(YELLOW)Syncing website$(CLEAR)"
	rsync -av $(BUILD_DIR) $(DESTINATION)

update:
	@echo "$(YELLOW)Update site if changed on remote master$(CLEAR)"
	git fetch
	if [ `git rev-parse origin/master` != `git rev-parse HEAD` ]; then \
		git pull && make generate sync; \
	fi

server: dirs $(PDF) $(EPUB)
	@echo "$(YELLOW)Running development server$(CLEAR)"
	hugo server -d $(BUILD_DIR) --watch

release:
	@echo "$(YELLOW)Releasing project$(CLEAR)"
	git tag -a "$(VERSION)" -m "$(MESSAGE)"
	git push origin "$(VERSION)"

clean:
	@echo "$(YELLOW)Cleaning generated files$(CLEAR)"
	rm -rf $(BUILD_DIR)

cv:
	@echo "$(YELLOW)Generating resume$(CLEAR)"
	mkdir -p $(BUILD_DIR)
	cp content/article/michel-casabianca.md $(BUILD_DIR)
	cd $(BUILD_DIR) && \
		md2pdf michel-casabianca.md && \
		pandoc -t docx -o michel-casabianca.docx michel-casabianca.md && \
		rm michel-casabianca.md
	for dest in $(CV_DESTS); do \
		scp $(BUILD_DIR)/michel-casabianca.* $${dest}/../public/; \
	done

help:
	@echo "$(CYAN)init$(CLEAR)      Create virtualenv"
	@echo "$(CYAN)dirs$(CLEAR)      Create destination directories"
	@echo "$(CYAN)generate$(CLEAR)  Generate static site"
	@echo "$(CYAN)sync$(CLEAR)      Synchronize site with server"
	@echo "$(CYAN)server$(CLEAR)    Run development server"
	@echo "$(CYAN)release$(CLEAR)   Release project"
	@echo "$(CYAN)clean$(CLEAR)     Clean generated files"

