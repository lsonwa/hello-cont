## Student instructions
# Dockerfile should pass hadolint
# app.py should pass pylint
# optional, but recommended, build a simple integration test

setup:
	# Create python virtualenv & source it
	# source ~/.udacity-devops/bin/activate
	#python3 -m venv ~/.dockerprojct

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb
	
validate-circleci:
	circleci config process .circleci/config.yml
	
run-circleci-local:
	circleci local execute build 

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	#hadolint --ignore DL3013 Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 hello.py

all: install lint test