#!/bin/bash
#
# Clone all chapters in folders next to this one.
#
# This means that after this script, you'll have a folder structure like:
#
#   ../bevy_tdd_book
#   ../bevy_tdd_book_hello_world
#   ../bevy_tdd_book_[other chapters]
#
# Usage:
#
#   ./scripts/clone_all_chapters.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/clone_all_chapters.sh"
    echo " "
    exit 42
fi

# ls *.md | grep -v [A-Z] | grep -v "faq\\.md" 
rscript scripts/clone_all_chapters_impl.R


