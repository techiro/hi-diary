MINT_VERSION = 0.16.0
PRODUCT_NAME := HiDiary
PROJECT_NAME := ${PRODUCT_NAME}.xcodeproj
.DEFAULT_GOAL := help

.PHONY: setup-mint
setup-mint: # setup Mint package dependencies.
	git clone https://github.com/yonaskolb/Mint.git -b ${MINT_VERSION}
	cd Mint && make
	rm -rf Mint/
	#bootstrap: Mintfileを用意してインストールしたツールを管理できる
	mint bootstrap --overwrite y

.PHONY: xcodegen
xcodegen: # Run xcodegen in this project
	mint run xcodegen

.PHONY: sort
sort: # Sort Project file and folder.
	curl -sS https://raw.githubusercontent.com/WebKit/webkit/master/Tools/Scripts/sort-Xcode-project-file \
    > ./script.pl \
    && perl ./script.pl `find . -maxdepth 1 -mindepth 1 -iname "*.xcodeproj"` \
    && rm -f ./script.pl


.PHONY: open
open: # open Xcode Projects.
	open ./${PROJECT_NAME}

.PHONY: clean
clean: # Delete cache
	rm -rf ./Pods
	rm -rf ./Carthage
	xcodebuild clean -alltargets

.PHONY: help
help: # help: Outputs each task and the comment
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-42s%s\n", $$1 $$3, $$2}'

.PHONY: update-carthage
update-carthage: # update carthage
	mint run carthage update --platform iOS
	@$(MAKE) show-carthage-dependencies

.PHONY: show-carthage-dependencies
show-carthage-dependencies:
	@echo '*** Resolved dependencies:'
	@cat 'Cartfile.resolved'
