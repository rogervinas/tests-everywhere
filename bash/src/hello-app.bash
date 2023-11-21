function helloApp() {
    local messageFn=$1
    local consoleFn=$2
    $consoleFn "$($messageFn)"
}
