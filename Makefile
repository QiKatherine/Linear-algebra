LATEXMK = latexmk
LMFLAGS = --xelatex --silent
RM = rm -rf

LATEXSRC = $(wildcard *.tex)
TEXFILES = $(basename $(LATEXSRC))

%.pdf: %.tex tex_distclean
	$(LATEXMK) $(LMFLAGS) $<
	$(LATEXMK) -c
	# $(XELATEX) $(TEXFLAGS) $<
	# $(BIBLATEX) $(basename $<)
	# $(XELATEX) $(TEXFLAGS) $<
	# $(XELATEX) $(TEXFLAGS) $<

tex_clean:
	$(LATEXMK) -c
	$(RM) $(TEXFILES:=.out) $(TEXFILES:=.blg) $(TEXFILES:=.bbl) $(TEXFILES:=.idx) $(TEXFILES:=.aux) $(TEXFILES:=.log) $(TEXFILES:=.txt)

tex_distclean: tex_clean
	$(LATEXMK) -C
	$(RM) $(TEXFILES:=.pdf)
