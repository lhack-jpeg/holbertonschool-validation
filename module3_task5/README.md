# DevOps: Automate Everything to Focus on What Really Matters

## By Luke Hackett

## Learning Objectives

This project aims at showing use cases where a DevOps mindset is bringing value
 to a software project by automating it, which decreases the amount of manual
 work and increases the development speed. It focuses on why automation is useful
 and helps speeding a development lifecycle.

After this project, you should be able to:

- Understand the value of automating tedious tasks
- Define a development lifecycle
- Automate shell-like tasks with Make, and/or shell script
- Be aware of tools dependencies and the value of reproducing environment
- Build static HTML website from Markdown code using Go-Hugo

## Prerequisites

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix
toolset (ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- Git (command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.80+

## Project State

## Workflow

The project state currently is using Github actions.

It performs the following actions:

- Clones the repo
- Position yourself in the correct directory and execute the command `make help`
to validate that the Makefile is present and implements the help target check.

It is triggered when:

- Each time there is new code pushed on your repository
- Once a day

## Build Workflow

The actions performed at midnight and every time the repo is pushed is:

- Clone the repo
- Run setup.sh to download and install the missing packages
- Lint the yaml and shell file
- Make a build
- Make a post
- Run server and curl the website
- Clean up the repo.

## Draft release

A new version is made on pull requests with a new tag.

## Lifecycle

### Planning

The team is looking to move the internal wiki on to HUGO as the team is
comfortable with it.

### Requirements

### To run

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix toolset
(ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- Git (command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.80+

---

### To Edit

- Your favourite IDE, emacs, vscode.

### Product Architecture

### Developing the Product

The program is generated uising the inbuilt functions provided by HUGO 0.80+.
The Makefile is built to GNU Make v4.3
Hugo 0.80+

### Testing the Product

### Deployment

A release is created when a tag is supplied on commit

## following make file use `make <command>`

---

| Command  | Tasks                                  |
| -------- | ---------------------------------------|
| build    | Generate the website from the markdown and configuration files in the directory dist/.|
| clean    | Cleanup the content of the directory dist/|
| p[ost     | Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME. |
| lint     | Lints the shell script `setup.sh` and on success runs `make yamllint` and lints markdown FILES                |
| yamllint | Lints the `github-workflow.yml` file.|
| markdownlint | lints the `README.md` and `DEPLOY.md` files |
| package | creates a zip archive of the the latest build and stores it under `awesome-website.zip` |
|unit-tests| runs multiple make recipes. |
| integration-tests | runs make post and make build |
| validate | prints out the pwd |
| Help     | Print out all build recipes. |
