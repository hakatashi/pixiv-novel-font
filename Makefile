all: pixiv-novel-font.ttf

pixiv-novel-font.ttf: fonts/ipam.ttf fonts/ipamp.ttf build.pe
	fontforge build.pe

fonts/ipam%ttf fonts/ipamp%ttf: IPAfont00303.zip
	mkdir -p fonts
	unzip -o $< -d .
	mv IPAfont00303/* fonts
	rm IPAfont00303 -rf
	touch fonts/ipam$*ttf
	touch fonts/ipamp$*ttf

IPAfont00303.zip:
	wget http://ipafont.ipa.go.jp/ipafont/IPAfont00303.php -O $@
	touch $@

dist: pixiv-novel-font.zip

pixiv-novel-font.zip: pixiv-novel-font.ttf
	mkdir -p pixiv-novel-font
	cp README.md Makefile build.pe pixiv-novel-font.ttf pixiv-novel-font/
	cp fonts/Readme_IPAfont00303.txt fonts/IPA_Font_License_Agreement_v1.0.txt pixiv-novel-font/
	cp -r glyphs pixiv-novel-font/
	zip pixiv-novel-font.zip -r pixiv-novel-font

clean:
	-rm -f pixiv-novel-font.ttf pixiv-novel-font.zip
	-rm -rf pixiv-novel-font

clobber: clean
	-rm -r fonts/

.PHONY: all clean clobber dist
