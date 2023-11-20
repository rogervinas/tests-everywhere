[![CI](https://github.com/rogervinas/tests-everywhere/actions/workflows/rust.yml/badge.svg)](https://github.com/rogervinas/tests-everywhere/actions/workflows/rust.yml)
![Rust](https://img.shields.io/badge/Rust-1.74.0-blue?labelColor=black)

# Rust

[Rust](https://www.rust-lang.org/) testing with [mockall](https://docs.rs/mockall/latest/mockall/)

## Run this project using 🐳 [docker](https://www.docker.com/)
* Execute `./docker-run.sh`
* Once inside the container:
  * First time only, install dependencies with `bundle install`
  * Test with `cargo test`
  * Run with `cargo run`
  * Build with `cargo build`

## Run this project locally

### Pre-requisites
* Install [Rustup](https://www.rust-lang.org/tools/install) manually or ...
  * List active toolchain installed executing `rustup show`
  * List [Cargo](https://doc.rust-lang.org/cargo/) version installed executing `cargo --version`

### Run locally
* Test with `cargo test`
* Run with `cargo run`
* Build with `cargo build`

### Create project from scratch
* Create project with `cargo new <project-name>`
* Install [mockall](https://docs.rs/mockall/latest/mockall/) dependency with `cargo add mockall --dev`
