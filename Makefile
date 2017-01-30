all: format
	
format:
	elm-format-0.18 --yes **/*.elm

reactor:
	elm-reactor
