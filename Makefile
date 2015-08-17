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
