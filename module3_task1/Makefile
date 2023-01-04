HUGO=hugo
RM=rm -rf

build: ## Builds a new website
	$(HUGO)

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from target folder
	$(RM) dist/*

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1
