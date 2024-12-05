BIN_DIR ?= /usr/local/bin

install:
	find . -type f ! -path './.git/*' ! -name 'Makefile' -exec cp {} $(BIN_DIR) \; -exec chmod +x $(BIN_DIR) \;

