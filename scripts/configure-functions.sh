#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=scripts/.env
. "$SCRIPT_DIR"/.env

az deployment group create \
    --name "configure-functions" \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --template-file "${SCRIPT_DIR}/../infra/functions.bicep" \
    --parameters appName="$FUNCTIONAPP_NAME"
