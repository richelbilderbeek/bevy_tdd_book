#!/bin/bash
#
# Build tree-sitter
#
# Usage:
#
#   ./scripts/build_tree_sitter.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/build_tree_sitter.sh"
    echo " "
    exit 42
fi

cd scripts
mkdir tree_sitter
cd tree_sitter
~/.cargo/bin/tree-sitter init-config
wget https://raw.githubusercontent.com/tree-sitter/tree-sitter-rust/master/grammar.js
~/.cargo/bin/tree-sitter generate
