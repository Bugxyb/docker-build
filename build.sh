#!/bin/bash

function build() {
    docker build -t hyrule/baseenv ./baseenv
    docker build -t hyrule/redis ./redis
    docker build -t hyrule/nginx ./nginx
}

function clean() {
    docker rmi hyrule/baseenv hyrule/redis hyrule/nginx
}

function main() {
    case $1 in
        'build')
            build
        ;;
        'clean')
            clean
        ;;
    esac
}

main $@
