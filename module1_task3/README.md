# DevOps: Automate Everything to Focus on What Really Matters

## By Luke Hackett

## Learning Objectives

This project aims at showing use cases where a DevOps mindset is bringing value to a software project by automating it, which decreases the amount of manual work and increases the development speed. It focuses on why automation is useful and helps speeding a development lifecycle.

After this project, you should be able to:

- Understand the value of automating tedious tasks
- Define a development lifecycle
- Automate shell-like tasks with Make, and/or shell script
- Be aware of tools dependencies and the value of reproducing environment
- Build static HTML website from Markdown code using Go-Hugo

## Prerequisites

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix toolset (ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- Git (command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.80+

## Lifecycle

##### Planning

The team is looking to move the internal wiki on to HUGO as the team is comfortable with it.

##### Requirements

###### To run

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix toolset (ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- Git (command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.80+

---

###### To Edit:

- Your favourite IDE, emacs, vscode.

##### Product Architecture

##### Developing the Product

The program is generated uising the inbuilt functions provided by HUGO 0.80+.
The Makefile is built to GNU Make v4.3
Hugo 0.80+

##### Testing the Product

##### Deployment

### Using the make file:

The Makefile contains the following commands:
To run the make file use the `make <command>`

`build`:
Builds a new version of the website to the `/dist/` folder

`clean`:
Removes the contents of the `/dist/` folder.

`help`:
Prints out information of the commands to the terminal.

`post`:
Creates a new post in the contents/post folder with POST_TITLE and POST_NAME
set from the ENV variables.
