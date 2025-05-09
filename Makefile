BIN_DIR ?= /usr/local/bin

install:
	for f in $$(find . -type f ! -path './.git/*' ! -name 'Makefile'); do \
		cp "$$f" $(BIN_DIR)/$$(basename "$$f"); \
		chmod +x $(BIN_DIR)/$$(basename "$$f"); \
	done

