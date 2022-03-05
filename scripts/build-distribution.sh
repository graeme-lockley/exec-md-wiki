#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=scripts/.env
. "$SCRIPT_DIR"/.env

OUTPUT_PATH="$SCRIPT_DIR"/../"$BUILD_OUTPUT_PATH"
OUTPUT_FILE_NAME="$SCRIPT_DIR"/../"$BUILD_PACKAGE_PATH_FILE_NAME"

mkdir -p "$OUTPUT_PATH"

cd "$SCRIPT_DIR"/../src || exit 1
dotnet publish --configuration Release --output "$OUTPUT_PATH"

cd "$OUTPUT_PATH" || exit 1
zip -r "$OUTPUT_FILE_NAME" .
