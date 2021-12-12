PAPER_NAME := paper-template

base:
	pdflatex -enable-write18 --shell-escape $(PAPER_NAME).tex

nobib:
	pdflatex -draftmode -enable-write18 --shell-escape $(PAPER_NAME).tex && \
	pdflatex -enable-write18 --shell-escape $(PAPER_NAME).tex

all:
	pdflatex -draftmode -enable-write18 --shell-escape $(PAPER_NAME).tex && \
	bibtex $(PAPER_NAME).aux && \
	pdflatex -enable-write18 --shell-escape $(PAPER_NAME).tex && \
	pdflatex -enable-write18 --shell-escape $(PAPER_NAME).tex

zip: distclean
	rm -f *.aux \
	$(PAPER_NAME).log \
	$(PAPER_NAME).blg \
	$(PAPER_NAME).out \
	$(PAPER_NAME).dvi \
	$(PAPER_NAME)*.gz \
	$(PAPER_NAME).zip
	zip -r $(PAPER_NAME).zip . -x '*.git*' '*README.md' '*.sh' '*~*' '*install_elvish_fonts*' '*texmf*' '*.DS_Store*' '*.emacs*' '*.xcf' '*.drawio' '*.pdf'

distclean: clean
	rm -f	$(PAPER_NAME).pdf

clean:
	rm -f *.aux \
	$(PAPER_NAME).log \
	$(PAPER_NAME).blg \
	$(PAPER_NAME).bbl \
	$(PAPER_NAME).out \
	$(PAPER_NAME).dvi \
	$(PAPER_NAME)*.gz \
	$(PAPER_NAME).zip \


install:
	sudo apt-get install texlive-full texlive-luatex texlive-science
