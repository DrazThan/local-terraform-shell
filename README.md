I wrote this script while working on a gitops managed terraform environment in GCP with multiple Project IDs. Wanted a quick handly little tool to keep switching and testing my tf files.

## Key Features

1. **Dynamic Backend Configuration**: Automatically generates backend configurations based on your Google Cloud project ID, ensuring your Terraform state is always stored in the right location.

2. **Flexible Variable Management**: 
   - Support for `.tfvars` files
   - Dynamic loading of variable files via environment variables
   - Direct environment variable support for quick overrides

3. **Command Versatility**: Compatible with all Terraform commands (init, plan, apply, etc.), automatically including the correct backend configuration.

4. **Local Testing Capabilities**: Validate your Terraform changes locally before pushing to GitOps-managed infrastructure.

## Empowering Your Workflow

### Multi-Environment Mastery

Seamlessly switch between different environments by dynamically loading specific `.tfvars` files or setting environment variables on the fly. This flexibility allows for rapid testing and deployment across various configurations.

### Streamlined Variable Handling

Manage sensitive or frequently changing variables with ease. Load them directly as environment variables, reducing the need for multiple `.tfvars` files and enhancing security.

### Local Infrastructure Validation

Test your Terraform changes in a controlled local environment before committing to your GitOps workflow, ensuring smoother deployments and reducing potential issues in production.

## Getting Started

1. **Set Your Project ID**:
   ```bash
   export PROJECT_ID="your-gcp-project-id"
   ```

2. **Run Terraform Commands**:
   ```bash
   ./local_terraform.sh init
   ./local_terraform.sh plan
   ./local_terraform.sh apply
   ```

3. **Use Dynamic .tfvars Files**:
   ```bash
   export TFVARS_FILE="myvariables.tfvars"
   ./local_terraform.sh plan
   ```

4. **Leverage Environment Variables**:
   ```bash
   export TF_VAR_region="us-central1"
   export TF_VAR_instance_type="n1-standard-1"
   ./local_terraform.sh plan
   ```
