#!/bin/bash
#
# Extract code snippets.
# Uses tree-sitter.
#
# Usage:
#
#   ./scripts/extract_code_snippets.sh

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

~/.cargo/bin/tree-sitter
