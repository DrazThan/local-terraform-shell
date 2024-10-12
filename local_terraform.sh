#!/bin/bash

# Check if PROJECT_ID is set
if [ -z "$PROJECT_ID" ]; then
    echo "Please set the PROJECT_ID environment variable"
    exit 1
fi

# Check if a command was provided
if [ $# -eq 0 ]; then
    echo "Please provide a Terraform command (e.g., init, plan, apply)"
    exit 1
fi

# Generate the backend_override.hcl file
./generate_local_backend.sh

# Check if a variable file was provided
if [ -n "$TF_VAR_FILE" ]; then
    VAR_FILE_OPTION="-var-file=$TF_VAR_FILE"
else
    VAR_FILE_OPTION=""
fi

# If the command is 'init', pass the backend config file
if [ "$1" == "init" ]; then
    terraform init -backend-config=backend_override.hcl "${@:2}"
else
    terraform $1 $VAR_FILE_OPTION "${@:2}"
fi
