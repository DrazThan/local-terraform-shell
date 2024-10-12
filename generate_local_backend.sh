#!/bin/bash

# Check if PROJECT_ID is set
if [ -z "$PROJECT_ID" ]; then
    echo "Please set the PROJECT_ID environment variable"
    exit 1
fi

# Generate the backend_override.tf file
cat << EOF > backend_override.hcl
bucket = "${PROJECT_ID}-terraform-state"
prefix = "terraform/state"
EOF

echo "backend_override.hcl generated successfully"