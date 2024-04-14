PREFIX?=/usr/local

OS:=$(shell uname -s)

Python3?=$(shell python3-config --configdir)

VIM_VERSION?=v8.2.1738

VIM_SRC=/tmp/vim

.PHONY: all-vim
all-vim: vim aux ccls Vim-Plug color vimrc

.PHONY: aux
aux:
	pip3 install --user pynvim
	sudo port install global
	sudo port install ctags
	sudo port install fzf

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
	sudo port install bear
endif

ccls: llvm
ifeq ($(OS), Linux)
	sudo pacman -S ccls
else ifeq ($(OS), Darwin)
	sudo port install ccls
endif

llvm:
ifeq ($(OS), Linux)
	sudo pacman -S llvm
else ifeq ($(OS), Darwin)
	sudo port install llvm-12
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
		make -j8 VIMRUNTIMEDIR=/usr/local/share/vim/vim82 && \
		sudo make install && \
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
