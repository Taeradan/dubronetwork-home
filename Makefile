all: build

build: format
	elm-make --warn **/*.elm

format:
	elm-format-0.18 --yes **/*.elm

reactor:
	elm-reactor
