.PHONY: help build

SHELL      := /bin/bash
TYP_FILE   := curriculum.typ
OUTPUT_DIR := output
TEMP_PDF   := $(OUTPUT_DIR)/curriculum.pdf
OUTPUT_PDF := $(OUTPUT_DIR)/CV_JULIO_SILVA.pdf
GS         := gs
TYPST_IMG  := ghcr.io/typst/typst:latest

help: ## Show this help
	@echo -e "\033[33mCommands\033[0m"
	@awk -F ':.*?## ' '/^[-a-zA-Z0-9_.]+:.*?##/ {printf "\033[36m- %-30s\033[0m| %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Compile CV via Typst (Docker); compress with Ghostscript if available
	@mkdir -p $(OUTPUT_DIR)
	@echo "Compiling CV..."
	@docker run --rm \
		-u "$$(id -u):$$(id -g)" \
		-v "$(CURDIR)/cv":/cv:ro \
		-v "$(CURDIR)/$(OUTPUT_DIR)":/output \
		$(TYPST_IMG) \
		compile --font-path /cv/fonts /cv/$(TYP_FILE) /output/curriculum.pdf
	@if command -v $(GS) > /dev/null 2>&1; then \
		echo "Compressing output..."; \
		$(GS) -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
			-dPDFSETTINGS=/prepress \
			-dNOPAUSE -dQUIET -dBATCH \
			-sOutputFile=$(OUTPUT_PDF) $(TEMP_PDF); \
		rm -f $(TEMP_PDF); \
	else \
		mv $(TEMP_PDF) $(OUTPUT_PDF); \
	fi
	@echo "Done: $(OUTPUT_PDF)"
