#!/bin/bash

VERSION="$1"
MANIFEST_FILE="ESOComplications.txt"

function chsv_check_version() {
  if [[ $1 =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?$ ]]; then
    echo "$1"
  else
    echo ""
  fi
}

if [[ ! $(chsv_check_version $VERSION) ]]; then
    echo "$VERSION is not a valid version string"
    exit 1;
fi

if ! test -f "$MANIFEST_FILE"; then
    echo "$MANIFEST_FILE not found"
    exit 1;
fi

sed -i "s/\(## Version:\) \([0-9]\+\.[0-9]\+\.[0-9]\+\)/\1 $VERSION/" $MANIFEST_FILE