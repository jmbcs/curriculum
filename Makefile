.PHONY: help build watch

SHELL := /bin/bash
LATEX_FILE := curriculum.tex
OUTPUT_DIR := output
OUTPUT_PDF := curriculum.pdf
TEMP_PDF := $(OUTPUT_DIR)/temp.pdf
GS := gs

help: ## Show this help
	@echo -e "\033[33mCommands\033[0m"
	@awk -F ':.*?## ' '/^[-a-zA-Z0-9_.]+:.*?##/ {printf "\033[36m- %-30s\033[0m| %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build a compressed PDF and clean up temporary files
	@mkdir -p $(OUTPUT_DIR)
	@echo "Building CV..."
	@cd cv && pdflatex -halt-on-error -output-directory=../$(OUTPUT_DIR) $(LATEX_FILE)
	@echo "Compressing PDF..."
	@$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(OUTPUT_PDF) $(OUTPUT_DIR)/$(LATEX_FILE:.tex=.pdf)
	@echo "Cleaning up temporary files..."
	@find . -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.xmpi" -o -name "*.run.xml" -o -name "*.bcf" -o -name "*.synctex.gz" -o -name "$(OUTPUT_DIR)/$(LATEX_FILE:.tex=.pdf)" \) -exec rm -f {} \;
	@echo "Build complete: $(OUTPUT_PDF)"

watch: ## Watch for changes and rebuild (requires inotifywait)
	@echo "Watching for changes (Ctrl+C to stop)..."
	@while true; do \
		find cv -type f -name "*.tex" -o -name "*.sty" | inotifywait -e modify -q --fromfile -; \
		$(MAKE) build; \
	done
