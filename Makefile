SHELL := bash

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: bashrc vimrc gitconfig all-vim

include vim/makefile

bashrc:
	ln -sf $(ROOT_DIR)/.aliases $(HOME)/.aliases
	ln -sf $(ROOT_DIR)/.bashrc $(HOME)/.bashrc
	ln -sf $(ROOT_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(ROOT_DIR)/.bash_prompt $(HOME)/.bash_prompt
	ln -sf $(ROOT_DIR)/.tmux.conf $(HOME)/.tmux.conf

gitconfig:
	ln -sf $(ROOT_DIR)/.gitignore_global $(HOME)/.gitignore_global
	ln -sf $(ROOT_DIR)/.gitconfig $(HOME)/.gitconfig
