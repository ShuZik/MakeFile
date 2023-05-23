# Welcome to the ShuZik MakeFile v2.0!
# Its purpose is to simplify the installation for smooth and effortless start.
# To execute this script, kindly adhere to the following instructions:

### 1) Open the terminal and run the installation command: make -f Makefile install
### 2) Open the terminal and run the updating command: make -f Makefile update

# Sit back, relax, and enjoy the seamless experience!

# P.S. You have the flexibility to configure the install_packages section according to your specific application needs.

SHELL := /bin/bash
PATH := /usr/local/bin:$(PATH)

ruby_version := $(shell rbenv install -l | grep -v - | tail -1)
current_ruby_version := $(shell rbenv version | awk '{print $$1}')

xcode:
	@if ! command -v xcodebuild >/dev/null; then \
		xcode-select --install; \
		while ! command -v xcodebuild >/dev/null; do sleep 1; done; \
	else \
		echo "Xcode is already installed."; \
	fi

homebrew:
	@if ! command -v brew >/dev/null; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew is already installed."; \
	fi

rbenv:
	@if ! command -v rbenv >/dev/null; then \
		brew install rbenv; \
		echo 'if which rbenv > /dev/null; then eval "$$(rbenv init -)"; fi' >> ~/.bash_profile; \
		source ~/.bash_profile; \
	else \
		echo "rbenv is already installed."; \
	fi

ruby:
	@if [ "$(ruby_version)" != "$(current_ruby_version)" ]; then \
		sudo rbenv install $(ruby_version); \
		sudo rbenv global $(ruby_version); \
		sudo rbenv rehash; \
	else \
		echo "Ruby $(ruby_version) is already installed."; \
	fi

bundler:
	@if ! command -v bundler >/dev/null; then \
		gem install --user-install bundler; \
		rbenv rehash; \
	else \
		echo "Bundler is already installed."; \
	fi

create_folder:
	@if [ ! -d "~/Developer" ]; then \
		sudo mkdir -p ~/Developer; \
	else \
		echo "Developer folder already exists."; \
	fi

packages:
	brew upgrade cocoapods || brew install cocoapods
	brew upgrade fastlane || brew install fastlane
	brew upgrade rbenv-bundler || brew install rbenv-bundler
	brew upgrade --cask fork || brew install --cask fork
	brew upgrade --cask iterm2 || brew install --cask iterm2
	brew upgrade zsh || brew install zsh
	brew upgrade --cask slack || brew install --cask slack
	brew upgrade --cask figma || brew install --cask figma
	brew upgrade --cask telegram || brew install --cask telegram

	brew list --cask rectangle >/dev/null 2>&1 && brew upgrade --cask rectangle || \
	(brew list --cask rectangle-pro >/dev/null 2>&1 && brew upgrade --cask rectangle-pro || \
	(read -p "Which Rectangle would you install ? [r/R for Rectangle, p/P for Rectangle Pro, any other key to skip]:" answer; \
	case "$$answer" in \
		[Rr]) \
			brew install --cask rectangle;; \
		[Pp]) \
			brew install --cask rectangle-pro;; \
		*) \
			echo "Skipping Rectangle and Rectangle Pro installation.";; \
		esac;))


powerlevel10k:
	@if [ ! -d "$$HOME/.powerlevel10k" ]; then \
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k; \
		echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc; \
	else \
		echo "Powerlevel10k theme already exists."; \
	fi

open:
	open -a iTerm
	
	@if command -v rectangle >/dev/null; then \
		open -a Rectangle; \
	elif command -v rectangle-pro >/dev/null; then \
		open -a Rectangle\ Pro; \
	fi


.PHONY: xcode homebrew bundler rbenv ruby create_folder packages powerlevel10k open


install: xcode homebrew rbenv ruby bundler create_folder packages powerlevel10k open
update: rbenv ruby packages
