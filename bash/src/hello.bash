#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/hello-message.bash"
source "$(dirname "${BASH_SOURCE[0]}")/hello-console.bash"
source "$(dirname "${BASH_SOURCE[0]}")/hello-app.bash"

helloApp helloMessage helloConsole
