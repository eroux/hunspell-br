DEBIAN_FILES = debian/changelog debian/copyright debian/rules debian/compat debian/hunspell-br.info-hunspell debian/source debian/control debian/hunspell-br.docs debian/hunspell-br.install

ORIG_FILES = orig/README.txt orig/br_FR.dic orig/br_FR.aff

VERSION = 0.12

all: deb

original-archive: $(DEBIAN_FILES) $(ORIG_FILES)
	@echo "Making orig.tar.gz archive..."
	@mkdir -p hunspell-br && cp orig/* hunspell-br
	@tar czf hunspell-br_$(VERSION).orig.tar.gz hunspell-br

deb: original-archive
	@echo "Making .deb package..."
	@cp -R debian/ hunspell-br/
	@cd hunspell-br && dpkg-buildpackage

clean:
	@rm -rf hunspell-br
	@rm -rf *.tar.gz *.deb *.changes *.dsc
