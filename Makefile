.PHONY: pdf clean cleanPdf build watch unwatch

pdf: 
	latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf

cleanPdf:
	rm -f *.pdf

build: cleanPdf pdf 
	rm -f *.aux *.fdb_latexmk *.fls *.log *.log *.out *.synctex.gz

watch:
	watchman -- trigger . build '*.tex' -- make build

unwatch:
	watchman watch-del . 
