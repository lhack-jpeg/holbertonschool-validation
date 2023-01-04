HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq

build: ## Builds a new website
	$(HUGO)

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from target folder
	$(RM) dist/*

lint: ## Lints the yaml file and shell file.
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"
	$(YAMLLINT) ./github-workflow.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YQ) eval '.jobs.*.steps.[].name' ./github-workflow.yml | wc -l
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make lint' && echo OK
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make integration-test

integration-tests: ## Spin up a server and check the localhost url
	$(HUGO) server -D
	curl localhost:1313

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1
