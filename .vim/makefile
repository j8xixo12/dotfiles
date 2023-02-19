PREFIX?=/usr/local

OS:=$(shell uname -s)

Python3?=$(shell python3-config --configdir)

VIM_VERSION?=v8.2.1738

.PHONY: all-vim
all-vim: vim aux ccls Vim-Plug color vimrc

.PHONY: aux
aux:
	pip3 install --user pynvim

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
	port install bear
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
	sudo port install llvm
endif

.PHONY: vim
/tmp/vim:
	$(eval src = /tmp/vim)
	git clone https://github.com/vim/vim.git $(src)
vim: $(PREFIX)/bin/vim
$(PREFIX)/bin/vim: /tmp/vim
		$(eval src = /tmp/vim)
		cd $(src) && \
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
		rm -rf $(src)
		# echo 'alias vim='/usr/local/bin/vim'' >> ~/.bashrc
.PHONY: vimrc
vimrc:
	ln -sf $(ROOT_DIR)/.vim/.vimrc $(HOME)/.vimrc
	ln -sf $(ROOT_DIR)/.vim/vimsetting $(HOME)/.vim/vimsetting
	ln -sf $(ROOT_DIR)/.vim/file_type $(HOME)/.vim/file_type

	vim +PlugInstall +qall

path:
	@echo "$(ROOT_DIR)/.vim/"
