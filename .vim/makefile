PREFIX?=/usr/local

OS:=$(shell uname -s)

Python3?=$(shell python3-config --configdir)

VIM_VERSION?=v9.1.0955

VIM_SRC=/tmp/vim

.PHONY: all-vim
all-vim: vim aux ccls Vim-Plug color vimrc

.PHONY: aux
aux:
	pip3 install pynvim --break-system-packages \
    pip3 install python-language-server[all] --break-system-packages
ifeq ($(OS), Linux)
	sudo pacman -S global fzf rust cargo
else ifeq ($(OS), Darwin)
	brew install global
	brew install fzf
	brew install rust
	brew install cargo
	# for python on Apple silicon
	brew install ninja
	brew install libffi
endif

.PHONY: Vim-Plug
Vim-Plug: aux
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
color:
	git clone https://github.com/tomasr/molokai.git /tmp/molokai && \
	cd /tmp/molokai && \
	cp -R colors ~/.vim/ && \
	rm -rf /tmp/molokai

bear:
ifeq ($(OS), Linux)
	sudo apt-get -y install bear
else ifeq ($(OS), Darwin)
	brew install bear
endif

ccls: llvm
ifeq ($(OS), Linux)
	sudo pacman -S ccls
else ifeq ($(OS), Darwin)
	brew install ccls
endif

llvm:
ifeq ($(OS), Linux)
	sudo pacman -S llvm
else ifeq ($(OS), Darwin)
	brew install llvm
endif

.PHONY: vim
/tmp/vim:
	if [[ ! -f $(VIM_SRC) ]]; then \
	    git clone https://github.com/vim/vim.git $(VIM_SRC); \
	else \
		echo "Source code already downloaded."; \
	fi

vim: $(PREFIX)/bin/vim
$(PREFIX)/bin/vim: $(VIM_SRC)
		cd $(VIM_SRC) && \
		git checkout $(VIM_VERSION) && \
		./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(Python3) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=$(PREFIX) && \
		make -j8 VIMRUNTIMEDIR=$(PREFIX)/share/vim/vim91 && \
		make install && \
		rm -rf $(VIM_SRC)
		# echo 'alias vim='/usr/local/bin/vim'' >> ~/.bashrc
.PHONY: vimrc
vimrc:
	ln -sf $(ROOT_DIR)/.vim/.vimrc $(HOME)/.vimrc
	ln -sf $(ROOT_DIR)/.vim/vimsetting $(HOME)/.vim/vimsetting
	ln -sf $(ROOT_DIR)/.vim/file_type $(HOME)/.vim/file_type

	vim +PlugInstall +qall

path:
	@echo "$(ROOT_DIR)/.vim/"
