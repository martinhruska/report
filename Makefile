# the name of the output
CO=main
#CO=main-sigplanconf

# names of files other than sources the change of which should recompile the
# source
#CHANGED_FILES_OTHER =literature.bib
CHANGED_FILES_OTHER+=$(wildcard figs/*.tikz) $(wildcard figs/*.tex) $(wildcard *.tex) $(wildcard *.bib)

# List of TeX files
TEX_FILES=$(wildcard *.tex)

###############################################################################
#                                 Rules                                       #
###############################################################################

.PHONY: all clean

all: $(CO).pdf

$(CO).pdf: $(CO).tex $(TEX_FILES) $(CHANGED_FILES_OTHER)
#	pdflatex $<
#	pdflatex $<
	rubber --pdf $<
#	rubber-info --errors $<
#	rubber-info --check $<

clean:
	rm -f *.dvi *.log $(CO).blg $(CO).bbl $(CO).toc *.aux $(CO).out $(CO).lof
	rm -f $(CO).pdf
	rm -f *~
