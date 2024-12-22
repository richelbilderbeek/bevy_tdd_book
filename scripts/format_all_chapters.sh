#!/bin/bash
#
# Format all chapters' code using 'cargo fmt'
#
#
# Usage:
#
#   ./scripts/format_all_chapters.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/format_all_chapters.sh"
    echo " "
    exit 42
fi

Rscript scripts/format_all_chapters_impl.R


