SHELL:=bash

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: all
all: bashrc gitconfig all-vim tmux

include .vim/makefile

.PHONY: tmux
tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm
	ln -sf $(ROOT_DIR)/.tmux.conf $(HOME)/.tmux.conf

.PHONY: bashrc
bashrc:
	ln -sf $(ROOT_DIR)/.aliases $(HOME)/.aliases
	ln -sf $(ROOT_DIR)/.bashrc $(HOME)/.bashrc
	ln -sf $(ROOT_DIR)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(ROOT_DIR)/.bash_prompt $(HOME)/.bash_prompt

.PHONY: gitconfig
gitconfig:
	ln -sf $(ROOT_DIR)/.gitignore_global $(HOME)/.gitignore_global
	ln -sf $(ROOT_DIR)/.gitconfig $(HOME)/.gitconfig
