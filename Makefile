#
# Makefile
# Libao Jin, 2021-07-28 17:04
#
LATEXSRC = $(wildcard *.tex)
TEXFILES = $(basename $(LATEXSRC))
RM = rm

# LaTeX
LATEXMK = latexmk
LMFLAGS = -xelatex -silent
TEXFLAGS = -interaction=batchmode
PANDOCFLAGS = -f markdown

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

# vim:ft=make
#
