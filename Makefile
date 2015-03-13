out_dir ?= ./_dist
public_path ?= /listener/static/

webpack = ./node_modules/.bin/webpack \
	--config webpack.config.js \
	--output-path $(out_dir) \
	--output-public-path $(public_path)

prod: clean
	UGLIFY=1 HASH=1 DEV=0 $(webpack)

nouglify: clean
	UGLIFY=0 HASH=1 DEV=0 $(webpack)

dev: clean
	UGLIFY=0 HASH=0 DEV=1 $(webpack)

clean:
	rm -rf $(out_dir)

.PHONY: prod dev clean nouglify
