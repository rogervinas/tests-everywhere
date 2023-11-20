[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/javascript.yml)
![Node](https://img.shields.io/badge/Node-18.x-blue?labelColor=black)

# JavaScript

[JavaScript](https://developer.mozilla.org/docs/Web/JavaScript) testing with [Jest](https://jestjs.io/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
  * First time only, install dependencies with `npm install`
  * Test with `npm test`
  * Run with `npm start`

## Run this project locally

### Pre-requisites
* Install [Node.js](https://nodejs.org/en/) manually or ...
  * Install [Node Version Manager](https://github.com/nvm-sh/nvm) and ...
    * List available versions executing `nvm list`
    * Install **Node.js** executing `nvm use v18` or `nvm use stable`

### Run locally
* First time only, install dependencies with `npm install`
* Test with `npm test`
* Run with `npm start`

### Create project from scratch
* Create project using `npm init`
* Install [Jest](https://jestjs.io/) using `npm install --save-dev jest`
* Configure scripts in [package.json](javascript/package.json):
  ```json
  "scripts": {
    "start": "node Main.js",
    "test": "jest"
  }
  ```
