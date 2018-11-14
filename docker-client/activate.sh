#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null && pwd  )"

function instruct {
    echo "export DOCKER_HOST=$1"
    echo "export DOCKER_CERT_PATH=$DIR"
    echo "export DOCKER_TLS_VERIFY=\"1\""
    echo "# Run this command to configure your shell:"
    echo "# eval \$($0 env ${BASH_ARGV[0]})"
}
function switch_vm {
    instruct "tcp://swarm.viewsource.nl:2376"
}
function switch_local {
    echo "unset DOCKER_HOST"
    echo "unset DOCKER_CERT_PATH"
    echo "unset DOCKER_TLS_VERIFY"
    echo "# Run this command to configure your shell:"
    echo "# eval \$($0 env local)"
}
function show {
    echo "current environment: "
    echo "DOCKER_HOST=$DOCKER_HOST"
    echo "DOCKER_CERT_PATH=$DOCKER_CERT_PATH"
    echo "DOCKER_TLS_VERIFY=$DOCKER_TLS_VERIFY"
}
function switch {
    case "$1"
        in
        local) switch_local ;;
        vm)    switch_vm ;;
        *)     show ;;
    esac
}


case "$1"
    in
    env)     switch $2 ;;
    *)
        echo "Usage:  $0 env [local|vm]"
esac
