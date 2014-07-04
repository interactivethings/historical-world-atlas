.PHONY: all clean

GENERATED_FILES = \
	world.json

.SECONDARY:

all: node_modules $(GENERATED_FILES)

clean:
	rm -rf build $(GENERATED_FILES)

node_modules: package.json
	npm install
	touch $@

build/cshapes.zip:
	mkdir -p $(dir $@)
	curl 'http://downloads.weidmann.ws/cshapes/Shapefiles/cshapes_0.4-2.zip' -o $@.download
	mv $@.download $@

build/cshapes.shp: build/cshapes.zip
	unzip -d $(dir $@) $<
	touch $@
