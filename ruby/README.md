[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/ruby.yml)
![Ruby](https://img.shields.io/badge/Ruby-3.x-blue?labelColor=black)

# Ruby

[Ruby](https://www.ruby-lang.org) testing with [RSpec](https://rspec.info/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [ruby](ruby) folder
* Execute `./docker-run.sh`
* Once inside the container:
    * First time only, install dependencies with `bundle install`
    * Test with `rspec -fd`
    * Run with `ruby lib/Main.rb`

## Run this project locally

### Pre-requisites
* Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) manually or ...
    * Install [renv](https://github.com/rbenv/rbenv#readme) version manager and ..
        * List available versions executing `rbenv install -l`
        * Install **Ruby** executing `rbenv install 3.2.2` and `rbenv global 3.2.2`

### Run locally
* Go to [ruby](ruby) folder
* First time only, install dependencies with `bundle install`
* Test with `rspec -fd`
* Run with `ruby lib/Main.rb`

### Create project from scratch
* Just create a [Gemfile](ruby/Gemfile)
* Execute `bundle install`
