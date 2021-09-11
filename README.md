# jbfc
Jack's BF Compiler written in OCaml

## Description

Jack's BF Compiler is written in OCaml, and is transpiled to JavaScript using `js_of_ocaml`.

JBFC will transpile your BF code into unoptimized C code.

## Installing

Requirements:
* nodejs
* npm

To install the CLI of JBFC, run this:
```sh
# Install the command line tools
$ npm install --global jbfc
```

When you have installed JBFC as a command line tool, you are already done.

You can just run `jbfc` from the command line.

## Building from source

Requirements:
* ocaml
* dune
* js_of_ocaml

Please clone the git repository, and make sure to set permissions for the `*.sh` files (I did `chmod +x build.sh`).

To build and test the JS application, just execute `./build.sh`. The JS application will not run if you do not have `node` installed in your system.

To make a production build, run `./production.sh` and a `jbfc.js` file should be created in the root directory.
