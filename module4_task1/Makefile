HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq
MARKDOWN=markdownlint

build-docker: ## Builds a new docker image form build/Dockerfile
    docker build -t awesome:build -f build/Dockerfile .

build: ## builds a hugo website
	run-docker hugo awesome

run-docker:
    docker run awesome:build

awesome: ## generates awesome-api file
	touch awesome-api

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from target folder
	$(HUGO)
	$(RM) dist/*


lint: ## Lints the shell file and run yamllint on success.
	$(MARKDOWN) README.md
	$(MARKDOWN) DEPLOY.md
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 && make yamllint || echo "Lint Failed"


hugo: ## Generates a website
	$(HUGO)

yamllint: ## Yamllint github workflow.
	$(YAMLLINT) ./github-workflow.yml --no-warnings >/dev/null 2>&1 && echo OK
	$(YAMLLINT) ./release_drafter.yml --no-warnings >/dev/null 2>&1 && echo OK

markdownlint:
	$(MARKDOWN) README.md
	$(MARKDOWN) DEPLOY.md

integration-tests: ## Spin up a server and check the localhost url
	touch coverage-integrations.out;
	ls dist/;

unit-tests: ## Runs different makefile recipes
	make POST_TITLE='TEST' POST_NAME='this-is-a-test' post;
	touch coverage-units.out;


validate: ## Tests ensure it is in correct dir
	pwd

package: ## Creates a zip archive of the dist dir api binary.
	make build
	zip awesome-website.zip dist/index.html

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1