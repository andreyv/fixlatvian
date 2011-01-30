###############################################################################
#
# Makefile to build the package and documentation
#
# Requires GNU Make.
#
# Copyright (C) Andrey Vihrov <andrey.vihrov@gmail.com>, 2010-2011
#

# Package name
PACK       = fixlatvian

# Files to generate
FILES      = $(PACK).sty lv.ist

# Program names
LATEX     ?= xelatex -halt-on-error
MAKEINDEX ?= makeindex
KPSEWHICH ?= kpsewhich
PDFOPT    ?= pdfopt

###############################################################################

# Need to inhibit parallelism to avoid double .ins processing
.NOTPARALLEL:

.DELETE_ON_ERROR:

.PHONY: all package doc clean clean-all

all: package doc
package: $(FILES)
doc: $(PACK).pdf

$(FILES): $(PACK).ins $(PACK).dtx
	$(LATEX) $<

gind.lv.ist: lv.ist
	cat $$($(KPSEWHICH) gind.ist) $< > $@

define extra-latex-pass
$(MAKEINDEX) -s gglo.ist -o $(PACK).gls $(PACK).glo
$(MAKEINDEX) -s gind.lv.ist -o $(PACK).ind $(PACK).idx
$(LATEX) $<
endef
$(PACK).pdf: $(PACK).dtx $(PACK).sty gind.lv.ist
	$(LATEX) $<
	$(extra-latex-pass)
	$(extra-latex-pass)
	$(PDFOPT) $@ $@.tmp
	mv $@.tmp $@

clean:
	$(RM) $(addprefix $(PACK),.aux .glo .gls .idx .ilg .ind .log .out .toc)
	$(RM) gind.lv.ist

clean-all: clean
	$(RM) $(FILES) $(PACK).pdf

###############################################################################
