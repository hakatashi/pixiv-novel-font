all: pixiv-novel-font.otf

pixiv-novel-font.otf: fonts/ipam.ttf
	echo 'hogehoge' > pixiv-novel-font.otf

fonts/ipam.ttf: IPAfont00303.zip
	mkdir -p fonts
	unzip -o $< -d .
	mv IPAfont00303/* fonts
	rm IPAfont00303 -rf
	touch $@

IPAfont00303.zip:
	wget http://ipafont.ipa.go.jp/ipafont/IPAfont00303.php -O $@
	touch $@
