ARTIFACTS := dist/firefox/monospace-textarea.zip dist/chrome/monospace-textarea.zip

all: $(ARTIFACTS)

dist/firefox/monospace-textarea.zip: dist/firefox $(addprefix dist/firefox/,manifest.json images css)
	cd $(dir $@) && zip -r $(notdir $@) .

dist/firefox/manifest.json: manifests/manifest.firefox.json
	cp $< $@

dist/firefox/%: %
	rsync -avu $</ $@

dist/firefox:
	mkdir -p $@

dist/chrome/monospace-textarea.zip: dist/chrome $(addprefix dist/chrome/,manifest.json images css)
	cd $(dir $@) && zip -r $(notdir $@) .

dist/chrome/manifest.json: manifests/manifest.chrome.json
	cp $< $@

dist/chrome/%: %
	rsync -avu $</ $@

dist/chrome:
	mkdir -p $@

clean:
	rm -rf dist
