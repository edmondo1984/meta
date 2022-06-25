.PHONY: lint

lint:
	 R -e "library(lintr); lintr::lint_package()" > lint_result.txt