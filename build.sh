#!/bin/sh

if type "dune" > /dev/null; then
    dune build ./main.bc.js @fmt --auto-promote
    if type "node" > /dev/null; then
        node _build/default/main.bc.js "$@"
    fi
else
    echo "Error: dune doesn't exist in this system" >&2
    exit 1
fi
