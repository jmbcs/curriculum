
.PHONY: help
SHELL := /bin/bash
current_branch := $(shell git rev-parse --abbrev-ref HEAD)

help: ## Show this help
	@echo -e "\033[33mCommands\033[0m"
	@awk -F ':.*?## ' '/^[a-zA-Z0-9_-.]+:.*?##/ {printf "\033[36m- %-30s\033[0m| %s\n", $$1, $$2}' $(MAKEFILE_LIST)

clean:
	@find . -type f \( -name "*.aux" -o -name "*.bbl" -o -name "*.bcf" -o -name "*.fls"  -o -name "*.fdb_latexmk" -o -name "*.log" -o -name "*.out" -o -name "*.run.xml" -o -name "*.synctex.gz" -o -name "*.xmpi" -o -name "*.PDF" -o -name "*.BCF" -o -name "*.FLS" -o -name "*.LOG" -o -name "*.OUT" -o -name "*.RUN.XML" -o -name "*.SYNCTEX.GZ" -o -name "*.XMPI" \) -exec rm -f {} +

compress_cv:
	@ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \-dNOPAUSE -dQUIET -dBATCH -sOutputFile=CV_JULIO_SILVA.pdf temp/curriculum.pdf