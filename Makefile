install:
	find -type d -not -path '*.git*' -printf '%P\n' | xargs -I{} mkdir -p ~/.{}
	git ls-files | grep -v 'Makefile' | xargs -I{} cp {} ~/.{}
