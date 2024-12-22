#!/bin/bash
#
# Checks the spelling of all text in this repo
#
# Usage:
#
#   ./scripts/check_spelling.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/check_spelling.sh"
    echo " "
    exit 42
fi

pyspelling -c .spellcheck.yml