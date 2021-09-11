MINT_VERSION = 0.16.0

.PHONY: mint
mint:
	git clone https://github.com/yonaskolb/Mint.git -b $(MINT_VERSION)
	cd Mint && make
	rm -rf Mint/

.PHONY: xcodegen
xcodegen:
	mint run xcodegen

.PHONY: ccache
ccache:
	xcodebuild -alltargets clean ; rm -rf ~/Library/Developer/Xcode/DerivedData/ ; :

.PHONY: sort
sort:
	curl -sS https://raw.githubusercontent.com/WebKit/webkit/master/Tools/Scripts/sort-Xcode-project-file \
    > ./script.pl \
    && perl ./script.pl `find . -maxdepth 1 -mindepth 1 -iname "*.xcodeproj"` \
    && rm -f ./script.pl

