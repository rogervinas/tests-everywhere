[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/python.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/python.yml)
![Python](https://img.shields.io/badge/Python-3.12-blue?labelColor=black)

# Python

[Python](https://www.python.org/) testing with [unittest](https://docs.python.org/3/library/unittest.html)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
    * First time only, install dependencies with `bundle install`
    * Test with `python -m unittest discover -v`
    * Run with `python -m main`

## Run this project locally

### Pre-requisites
* Install [Python](https://www.python.org/downloads/) manually or ...
    * Install [pyenv](https://github.com/pyenv/pyenv) version manager and ..
        * List available versions executing `pyenv install -l`
        * Install **Python** executing `pyenv install 3.12` and `pyenv global 3.12`

### Run locally
* Test with `python -m unittest discover -v`
* Run with `python -m main`

### Create project from scratch
* As this project has no external modules required we do not need [requirements.txt](https://pip.pypa.io/en/stable/reference/requirements-file-format/)
* Just a bit of documentation on how to organize our code using [packages](https://docs.python.org/3/tutorial/modules.html#packages)
