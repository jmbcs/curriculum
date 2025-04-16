.PHONY: help build watch

SHELL := /bin/bash
LATEX_FILE := curriculum.tex
OUTPUT_DIR := output
TEMP_PDF := $(OUTPUT_DIR)/$(LATEX_FILE:.tex=.pdf)
OUTPUT_PDF := $(OUTPUT_DIR)/CV_JULIO_SILVA.pdf
GS := gs

help: ## Show this help
	@echo -e "\033[33mCommands\033[0m"
	@awk -F ':.*?## ' '/^[-a-zA-Z0-9_.]+:.*?##/ {printf "\033[36m- %-30s\033[0m| %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build a PDF with good image quality and clean up temporary files
	@mkdir -p $(OUTPUT_DIR)
	@echo "Building CV..."
	@cd cv && pdflatex -halt-on-error -output-directory=../$(OUTPUT_DIR) $(LATEX_FILE)
	@echo "Creating final PDF with preserved image quality..."
	@$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
		-dPDFSETTINGS=/prepress \
		-dNOPAUSE -dQUIET -dBATCH \
		-sOutputFile=$(OUTPUT_PDF) $(TEMP_PDF)
	@echo "Cleaning up temporary files..."
	@find $(OUTPUT_DIR) -type f \( -name "*.aux" -o -name "*.log" -o -name "*.out" -o -name "*.xmpi" -o -name "*.run.xml" -o -name "*.bcf" -o -name "*.synctex.gz" \) -exec rm -f {} \;
	@rm -f $(TEMP_PDF)
	@echo "Build complete: $(OUTPUT_PDF)"
