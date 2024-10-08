
SHELL := /bin/bash

help: ## This help
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"


venv: ## Setup virtual env
	python -m venv venv

setup: ## Setup environment
	source venv/bin/activate;pip install setuptools wheel
	source venv/bin/activate;pip install "pybind11[global]"
	source venv/bin/activate;source ./brew_llvm.sh;pip install -r requirements.txt

.PHONY: venv setup build

build: ## Build 
	source venv/bin/activate;CXXFLAGS="-g -std=c++11 -Wall -pedantic";python setup.py sdist bdist_wheel
	source venv/bin/activate;CXXFLAGS="-g -std=c++11 -Wall -pedantic";python setup.py sdist


