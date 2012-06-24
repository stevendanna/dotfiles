install:
	find . -type d -not -path '*.git*' -print | sed 's/^\.\/*//' | xargs -I{} mkdir -p ~/.{}
	git ls-files | grep -v 'Makefile' | xargs -I{} cp {} ~/.{}
