#!/bin/bash -
#===============================================================================
#
#          FILE: .travis-ci.sh
#
#         USAGE: ./.travis-ci.sh
#
#   DESCRIPTION: Generate the ml file and compile
#
#        AUTHOR: Danny Willems <contact@danny-willems.be>
#       CREATED: 04/06/2016 11:26
#      REVISION: 1.0
#===============================================================================

set -o nounset                              # Treat unset variables as an error

URL=https://github.com/dannywillems/ocaml-cordova-plugin-globalization.git
PLUGIN_PIN=cordova-plugin-globalization

export OPAMYES=1

if [ -f "$HOME/.opam/config" ]; then
    opam update
    opam upgrade
else
    opam init
fi

if [ -n "${OPAM_SWITCH}" ]; then
    opam switch ${OPAM_SWITCH}
fi
eval `opam config env`

export OCAMLRUNPARAM=b

opam pin add ocaml-js-stdlib https://github.com/dannywillems/ocaml-js-stdlib.git
opam update && opam upgrade -y
# Test for make and make clean
make && make clean

# Test for make install and make remove
make install && make remove && make clean

# Test for the pin and -package
opam pin add ${PLUGIN_PIN} ${URL}
ocamlfind ocamlc -c -o test.cmo -package gen_js_api -package ocaml-js-stdlib -package ${PLUGIN_PIN} -linkpkg test/test.ml
