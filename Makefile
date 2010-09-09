###############################################################################
#
# Makefile to build the package and documentation
#
# Requires GNU Make.
#
# Copyright (C) Andrey Vihrov <andrey.vihrov@gmail.com>, 2010
# Copyright (C) Madars Virza <madars@gmail.com>, 2010
#

# Package name
PACKAGE    = fixlatvian

# Program names
LATEX     ?= xelatex -halt-on-error
MAKEINDEX ?= makeindex

###############################################################################

.DELETE_ON_ERROR:

.PHONY: all clean clean-all

all: $(PACKAGE).sty $(PACKAGE).pdf

$(PACKAGE).sty: $(PACKAGE).ins $(PACKAGE).dtx
	$(LATEX) $<

define extra-latex-pass
$(MAKEINDEX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
$(MAKEINDEX) -s extra/gind.lv.ist -o $(PACKAGE).ind $(PACKAGE).idx
$(LATEX) $<
endef
$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty extra/gind.lv.ist
	$(LATEX) $<
	$(extra-latex-pass)
	$(extra-latex-pass)

clean:
	$(RM) $(addprefix $(PACKAGE),.aux .glo .gls .idx .ilg .ind .log .out .toc)

clean-all: clean
	$(RM) $(PACKAGE).sty $(PACKAGE).pdf

###############################################################################
