#!/bin/bash
#
# Fix the markdown style of all book chapters
#
# Usage:
#
#   ./scripts/fix_markdown_of_all_chapters.sh

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/fix_markdown_of_all_chapters.sh"
    echo " "
    exit 42
fi

cd ..

for folder in $(ls -d bevy_tdd_book_*)
do
  cd $folder
  echo "Fixing the markdown in folder ${folder}:"
  markdownlint "**/*.md" --fix 
  cd ..
done

