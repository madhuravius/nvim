SHELL := bash

format:
	# can be installed with cargo
	stylua .
.PHONY: format
