[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/go.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/go.yml)
![Go](https://img.shields.io/badge/Go-1.21.4-blue?labelColor=black)

# Go

[Go](https://go.dev/) testing

## Run this project using 🐳 [docker](https://www.docker.com/)
* Go to [go](go) folder
* Execute `./docker-run.sh`
* Once inside the container:
    * Test with `go test -test.v`
    * Run with `go run .`

## Run this project locally

### Pre-requisites
* Install [Go](https://go.dev/dl/)

### Run locally
* Go to [go](go) folder
* Test with `go test -test.v`
* Run with `go run .`

### Create project from scratch
* Execute `go mod init org.hello/main`
