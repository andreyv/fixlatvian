###############################################################################

# Package name
PACKAGE    = fixlatvian

# Program names
LATEX     ?= xelatex -halt-on-error
MAKEINDEX ?= makeindex

# Number of additional LaTeX passes. Detection of this number should be
# somehow automated...
PASSES     = 2

###############################################################################

.PHONY: all clean clean-all

all: $(PACKAGE).sty $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).ins $(PACKAGE).dtx
	$(LATEX) $<

$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty extra/gind.lv.ist
	$(LATEX) $<
	for I in $$(seq 1 $(PASSES)) ; do \
		$(MAKEINDEX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo && \
		$(MAKEINDEX) -s extra/gind.lv.ist -o $(PACKAGE).ind $(PACKAGE).idx && \
		$(LATEX) $< \
	; done

clean:
	$(RM) $(addprefix $(PACKAGE),.aux .glo .gls .idx .ilg .ind .log .out .toc)

clean-all: clean
	$(RM) $(PACKAGE).sty $(PACKAGE).pdf

###############################################################################
