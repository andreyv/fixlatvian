###############################################################################

# Package name
PACKAGE    = fixlatvian

# Program names
LATEX     ?= xelatex -halt-on-error
MAKEINDEX ?= makeindex

###############################################################################

.PHONY: all clean clean-all

all: $(PACKAGE).sty $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).ins $(PACKAGE).dtx
	$(LATEX) $<

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty
	$(LATEX) $<
	$(MAKEINDEX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	$(MAKEINDEX) -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	$(LATEX) $<
	$(LATEX) $<

clean:
	$(RM) $(addprefix $(PACKAGE),.aux .glo .gls .idx .ilg .ind .log .out .toc)

clean-all: clean
	$(RM) $(PACKAGE).sty $(PACKAGE).pdf

###############################################################################
