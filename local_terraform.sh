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

# Run the Terraform command
terraform $1 -backend-config=backend_override.hcl "${@:2}"