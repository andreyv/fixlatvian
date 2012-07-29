###############################################################################
#
# Makefile to build the package and documentation (GNU Make required)
#
# Copyright (C) 2010-2012 Andrey Vihrov <andrey.vihrov@gmail.com>
#
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.
#
# This work has the LPPL maintenance status `maintained'.
#
# The Current Maintainer of this work is
# Andrey Vihrov <andrey.vihrov@gmail.com>.
#
# See the README for a list of files that constitute this work.
#

# Package name
PACKAGE    = fixlatvian

# Files to generate
FILES      = $(PACKAGE).sty lv.ist

# Program names
LATEX     ?= xelatex -interaction=nonstopmode -halt-on-error
MAKEINDEX ?= makeindex
KPSEWHICH ?= kpsewhich
PDFOPT    ?= pdfopt

###############################################################################

.DELETE_ON_ERROR:

.PHONY: all package doc clean clean-all

all: package doc
package: $(FILES)
doc: $(PACKAGE).pdf

F = $(firstword $(FILES))
$(F): $(PACKAGE).ins $(PACKAGE).dtx
	$(LATEX) $<
$(filter-out $(F),$(FILES)): $(F)

gind.lv.ist: lv.ist
	cat $$($(KPSEWHICH) gind.ist) $< > $@

define extra-latex-pass
$(MAKEINDEX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
$(MAKEINDEX) -s gind.lv.ist -o $(PACKAGE).ind $(PACKAGE).idx
$(LATEX) $<
endef
$(PACKAGE).pdf: $(PACKAGE).dtx $(PACKAGE).sty gind.lv.ist
	$(LATEX) $<
	$(extra-latex-pass)
	$(extra-latex-pass)
	$(PDFOPT) $@ $@.tmp
	mv $@.tmp $@

clean:
	$(RM) $(addprefix $(PACKAGE).,aux glo gls idx ilg ind log out toc hd)
	$(RM) gind.lv.ist

clean-all: clean
	$(RM) $(FILES) $(PACKAGE).pdf

###############################################################################
