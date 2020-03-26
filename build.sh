#!/bin/bash

function build() {
    cd baseenv
    docker build -t hyrule/baseenv .
    cd ..

    cd nginx
    docker build -t hyrule/nginx .
    cd ..

    cd redis
    docker build -t hyrule/redis .
    cd ..
}

function clean() {
    docker rmi hyrule/redis hyrule/nginx hyrule/baseenv
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
