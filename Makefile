all: pres report

report: reppdf repdocx
	
pres:
	pandoc.exe presentation.md -o presentation.pdf --pdf-engine=lualatex -F pandoc-crossref --number-sections -t beamer --slide-level=2 
	
reppdf:
	pandoc report.md -o report.pdf --pdf-engine=lualatex -F pandoc-crossref --citeproc --number-sections
	
repdocx:
	pandoc report.md -o report.docx --pdf-engine=lualatex -F pandoc-crossref --citeproc --number-sections