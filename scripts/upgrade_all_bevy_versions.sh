#!/bin/bash
#
# Update all bevy versions
#
# Usage:
#
#   ./scripts/upgrade_all_bevy_versions.sh [from_version] [to_version]
#   ./scripts/upgrade_all_bevy_versions.sh 0.14.2 0.15

if [[ "$PWD" =~ scripts$ ]]; then
    echo "FATAL ERROR."
    echo "Please run the script from the project root. "
    echo "Present working director: $PWD"
    echo " "
    echo "Tip: like this"
    echo " "
    echo "  ./scripts/upgrade_all_bevy_versions.sh [from_version] [to_version]"
    echo "  ./scripts/upgrade_all_bevy_versions.sh 0.14.2 0.15"
    echo " "
    exit 42
fi

cd ..
(
  
)
