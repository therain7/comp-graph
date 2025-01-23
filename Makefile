NAME ?= comp

.PHONY: build clean depext

build:
	latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape $(NAME).tex

clean:
	latexmk -C $(NAME).tex

depext:
	sudo apt install fonts-cmu texlive-lang-cyrillic texlive-xetex texlive-bibtex-extra texlive-science texlive-plain-generic latexmk python3-pygments inkscape --yes
