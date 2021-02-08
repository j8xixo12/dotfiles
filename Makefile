SHELL := bash

all: bashrc vimrc gitconfig

include vim/makefile

bashrc:
	ln -sf $(PWD)/.aliases $(HOME)/.aliases
	ln -sf $(PWD)/.bashrc $(HOME)/.bashrc
	ln -sf $(PWD)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(PWD)/.bash_prompt $(HOME)/.bash_prompt

gitconfig:
	ln -sf $(PWD)/.gitignore_global $(HOME)/.gitignore_global
	ln -sf $(PWD)/.gitconfig $(HOME)/.gitconfig
