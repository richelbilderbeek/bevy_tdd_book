#!/bin/bash
#
# Check that all code use in a chapter is indeed still part
# of the code it is copy-pasted from
#
# Assumes that './scripts/clone_all_chapters.sh' has been run already
#
#   ../bevy_tdd_book
#   ../bevy_tdd_book_hello_world
#   ../bevy_tdd_book_[other chapters]
#
# Usage:
#
#   ./scripts/check_all_chapters_code.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/check_all_chapters_code.sh"
    echo " "
    exit 42
fi

# ls *.md | grep -v [A-Z] | grep -v "faq\\.md" 
Rscript scripts/clone_all_chapters_impl.R


