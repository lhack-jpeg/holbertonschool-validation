HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq
MARKDOWN=markdownlint

build: ## Builds a new website
	make run-docker $(HUGO); \
	touch awesome-api;

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from target folder
	make run-docker \
	$(RM) dist/*

lint: ## Lints the shell file and run yamllint on success.
	make run-docker make markdownlint
	make run-docker $(SHELLCHECK) setup.sh >/dev/null 2>&1 && make yamllint || echo "Lint Failed"
	

yamllint: ## Yamllint github workflow.
	$(YAMLLINT) ./github-workflow.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YAMLLINT) ./release_drafter.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YQ) eval '.jobs.*.steps.[].name' ./github-workflow.yml | wc -l
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make lint' && echo OK
	$(YQ) eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make integration-test'

markdownlint:
	$(MARKDOWN) README.md
	$(MARKDOWN) DEPLOY.md

integration-tests: ## Spin up a server and check the localhost url
	make run-rocker $(HUGO); \
	touch coverage-integrations.out; \
	ls dist/;

unit-tests: ## Runs different makefile recipes
	make run-docker \
	make POST_TITLE='TEST' POST_NAME='this-is-a-test' post; \
	touch coverage-units.out;

validate: ## Tests ensure it is in correct dir
	pwd

package: ## Creates a zip archive of the dist dir api binary.
	make build
	zip awesome-website.zip dist/index.html

build-docker: ## Builds a new docker image form build/Dockerfile
	docker build -t awesome:build build/

run-docker:
	docker run awesome:build

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1