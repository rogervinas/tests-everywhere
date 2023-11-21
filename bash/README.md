[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/bash.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/bash.yml)
![Bash](https://img.shields.io/badge/Bash-5.2-blue?labelColor=black)

# Bash

[Bash](https://www.gnu.org/software/bash/) testing with [BATS](https://bats-core.readthedocs.io/en/stable/#)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
  * Test with `./test/bats/bin/bats test/hello.bats`
  * Run with `./src/hello.bash`

## Run this project locally

### Pre-requisites
* Ensure you have **bash** installed `bash --version` (this project uses version 5.2)
* Install [BATS submodules](https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation)
  ```
  git submodule add https://github.com/bats-core/bats-core.git test/bats
  git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
  git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert
  ```

### Run locally
* Test with `./test/bats/bin/bats test/hello.bats`
* Run with `./src/hello.bash`

### Create project from scratch
* Just create bash scripts! 😄
