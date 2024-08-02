#!/bin/bash
#
# Fix the markdown style
#
# Usage:
#
#   ./scripts/fix_markdown.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/fix_markdown.sh"
    echo " "
    exit 42
fi

markdownlint "**/*.md" --fix
git status