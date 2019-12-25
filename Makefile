.PHONY: all build clean

all: build

clean:
	if [[ -f ./dist/index.js ]]; then rm -rf ./dist/index.js; fi

build: clean
	./node_modules/.bin/ncc build index.js