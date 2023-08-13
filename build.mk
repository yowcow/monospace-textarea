VERSION := v0.0.3
ARTIFACT := dist/monospace_textarea-$(BROWSER)-$(VERSION).zip

all: dist $(ARTIFACT)

dist:
	mkdir -p $@

clean:
	rm -rf dist

dist/%.zip: dist/manifest.json dist/LICENSE dist/images dist/css
	cd $(dir $@) && zip -r $(notdir $@) $(foreach in,$^,$(in:dist/%=%))

dist/manifest.json: manifest.json
	cp $< $@

dist/LICENSE: ../../LICENSE
	cp $< $@

dist/images dist/css:
	rsync -avu ../../$(notdir $@)/ $@

.PHONY: all clean
