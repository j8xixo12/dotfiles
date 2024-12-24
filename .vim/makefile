# ==============================
# Variables
# ==============================
PREFIX        ?= /usr/local
OS            := $(shell uname -s)
# Try to detect the user's package manager (apt-get, dnf, yum, pacman, brew, etc.)
PKG_MANAGER   := $(shell command -v apt-get || command -v dnf || command -v yum || command -v pacman || command -v brew || echo "")
PYTHON3       ?= $(shell python3-config --configdir)
VIM_VERSION   ?= v9.1.0955
VIM_SRC       ?= /tmp/vim
ROOT_DIR      := $(shell pwd)

# List of packages we want to install
COMMON_PACKAGES = global fzf rust

# ==============================
# Targets
# ==============================
.PHONY: all-vim aux Vim-Plug color bear ccls llvm vim vimrc path

all-vim: aux ccls Vim-Plug color vimrc

# ----------------------------------------------------------------------------
# Aux target: install python packages & system packages
# ----------------------------------------------------------------------------
aux:
ifeq ($(OS),Darwin)
	@which brew >/dev/null 2>&1 || (echo "Homebrew not found, please install it."; exit 1)
	# Using Homebrew on macOS
	brew install $(COMMON_PACKAGES) ninja libffi
else ifeq ($(OS),Linux)
	# Because we can’t rely solely on distro ID, we guess the pkg manager above.
	@if [ -z "$(PKG_MANAGER)" ]; then \
	  echo "No recognized package manager found on this Linux system."; \
	  echo "Please install $(COMMON_PACKAGES) manually."; \
	  exit 1; \
	else \
	  case "$(notdir $(PKG_MANAGER))" in \
	    apt-get) \
	      sudo apt-get update -y && sudo apt-get install -y $(COMMON_PACKAGES) ninja-build libffi-dev ;; \
	    dnf) \
	      sudo dnf install -y $(COMMON_PACKAGES) ninja-build libffi-devel ;; \
	    yum) \
	      sudo yum install -y $(COMMON_PACKAGES) ninja-build libffi-devel ;; \
	    pacman) \
	      sudo pacman -Sy --needed $(COMMON_PACKAGES) ninja libffi ;; \
	    brew) \
	      brew install $(COMMON_PACKAGES) ninja libffi ;; \
	    *) \
	      echo "Unknown package manager: $(PKG_MANAGER). Install $(COMMON_PACKAGES) manually."; \
	      exit 1; \
	    esac; \
	fi
else
	@echo "Unsupported OS: $(OS). Install dependencies manually."
endif

# ----------------------------------------------------------------------------
# Install Vim-Plug
# ----------------------------------------------------------------------------
Vim-Plug: aux
	@echo "Installing vim-plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# ----------------------------------------------------------------------------
# Color scheme
# ----------------------------------------------------------------------------
color:
	@echo "Installing Molokai color scheme..."
	git clone https://github.com/tomasr/molokai.git /tmp/molokai && \
	cd /tmp/molokai && \
	cp -R colors ~/.vim/ && \
	rm -rf /tmp/molokai

# ----------------------------------------------------------------------------
# Bear (C/C++ compilation database generator)
# ----------------------------------------------------------------------------
bear:
ifeq ($(OS), Linux)
	@if [ -z "$(PKG_MANAGER)" ]; then \
	  echo "No recognized package manager found. Please install Bear manually."; \
	  exit 1; \
	else \
	  case "$(notdir $(PKG_MANAGER))" in \
	    apt-get) sudo apt-get install -y bear ;; \
	    dnf|yum) sudo $(PKG_MANAGER) install -y bear ;; \
	    pacman)  sudo pacman -S --needed bear ;; \
	    brew)    brew install bear ;; \
	    *) echo "Please install Bear manually."; exit 1; \
	  esac; \
	fi
else ifeq ($(OS), Darwin)
	brew install bear
endif

# ----------------------------------------------------------------------------
# ccls (C/C++/Obj-C language server)
# ----------------------------------------------------------------------------
ccls: llvm
ifeq ($(OS),Linux)
	@if [ -z "$(PKG_MANAGER)" ]; then \
	  echo "No recognized package manager found. Please install ccls manually."; \
	  exit 1; \
	else \
	  case "$(notdir $(PKG_MANAGER))" in \
	    apt-get) sudo apt-get install -y ccls ;; \
	    dnf|yum) sudo $(PKG_MANAGER) install -y ccls ;; \
	    pacman)  sudo pacman -S --needed ccls ;; \
	    brew)    brew install ccls ;; \
	    *) echo "Please install ccls manually."; exit 1; \
	  esac; \
	fi
else ifeq ($(OS),Darwin)
	brew install ccls
endif

# ----------------------------------------------------------------------------
# llvm
# ----------------------------------------------------------------------------
llvm:
ifeq ($(OS),Linux)
	@if [ -z "$(PKG_MANAGER)" ]; then \
	  echo "No recognized package manager found. Please install LLVM manually."; \
	  exit 1; \
	else \
	  case "$(notdir $(PKG_MANAGER))" in \
	    apt-get) sudo apt-get install -y llvm ;; \
	    dnf|yum) sudo $(PKG_MANAGER) install -y llvm ;; \
	    pacman)  sudo pacman -S --needed llvm ;; \
	    brew)    brew install llvm ;; \
	    *) echo "Please install LLVM manually."; exit 1; \
	  esac; \
	fi
else ifeq ($(OS),Darwin)
	brew install llvm
endif

# ----------------------------------------------------------------------------
# Build and install Vim from source
# ----------------------------------------------------------------------------
vim: $(PREFIX)/bin/vim
$(PREFIX)/bin/vim: /tmp/vim
	@echo "Building Vim from source at version $(VIM_VERSION)..."
	cd $(VIM_SRC) && \
	git checkout $(VIM_VERSION) && \
	./configure --with-features=huge \
	            --enable-multibyte \
	            --enable-python3interp=yes \
	            --with-python3-config-dir=$(PYTHON3) \
	            --enable-perlinterp=yes \
	            --enable-luainterp=yes \
	            --enable-gui=gtk2 \
	            --enable-cscope \
	            --prefix=$(PREFIX) && \
	make -j8 VIMRUNTIMEDIR=$(PREFIX)/share/vim/vim91 && \
	make install && \
	rm -rf $(VIM_SRC)

# Clone Vim source if needed
/tmp/vim:
	@if [ ! -d "$(VIM_SRC)/.git" ]; then \
	  echo "Cloning Vim source to $(VIM_SRC)..."; \
	  git clone https://github.com/vim/vim.git $(VIM_SRC); \
	else \
	  echo "Vim source already exists at $(VIM_SRC)."; \
	fi

# ----------------------------------------------------------------------------
# Link vimrc and other config
# ----------------------------------------------------------------------------
vimrc:
	@echo "Linking your Vim config files..."
	ln -sf $(ROOT_DIR)/.vim/.vimrc     $(HOME)/.vimrc
	ln -sf $(ROOT_DIR)/.vim/vimsetting $(HOME)/.vim/vimsetting
	ln -sf $(ROOT_DIR)/.vim/file_type  $(HOME)/.vim/file_type
	ln -sf $(ROOT_DIR)/.config/coc/coc-settings.json $(HOME)/.vim/coc-settings.json

	# Automatically install plugins
	vim +PlugInstall +qall
	vim +"CocInstall coc-cmake coc-jedi coc-sh coc-json coc-markdownlint" +qall
# ----------------------------------------------------------------------------
# Utility target to echo paths
# ----------------------------------------------------------------------------
path:
	@echo "$(ROOT_DIR)/.vim/"
