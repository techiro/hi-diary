.PHONY: ccache
ccache:
	xcodebuild -alltargets clean ; rm -rf ~/Library/Developer/Xcode/DerivedData/ ; :

.PHONY: sort
	curl -sS https://raw.githubusercontent.com/WebKit/webkit/master/Tools/Scripts/sort-Xcode-project-file \
    > ./script.pl \
    && perl ./script.pl `find . -maxdepth 1 -mindepth 1 -iname "*.xcodeproj"` \
    && rm -f ./script.pl

