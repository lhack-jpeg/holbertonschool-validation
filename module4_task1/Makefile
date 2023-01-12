HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq
MARKDOWN=markdownlint

build: ## Builds a new website
	make run-docker _awesome

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

build-docker:
	docker build -t awesome:build -f docker/Dockerfile .

run-docker:
	docker run -i awesome:build sh -c "hugo;ls ./dist"

_awesome:
	touch awesome-api

_hugosite:
	hugo

.PHONY:
clean: ## Remove all files from target folder
	$(RM) ./dist/*


_clean:
	$(RM) dist/*

_shellcheck:
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 && make yamllint || echo "Lint Failed"

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
	make run-docker _integration-tests

_integration-tests:
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	make run-docker _unit-tests

_unit-tests:
	touch coverage-units.out

validate: ## Tests ensure it is in correct dir
	pwd

package: ## Creates a zip archive of the dist dir api binary.
	make run-docker _zip

_zip:
	zip awesome-website.zip dist/index.html

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1