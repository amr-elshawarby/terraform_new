# Terraform Multi-Region Deployment Example

This Terraform project deploys a solution consisting of an EC2 instance, S3 bucket, and DynamoDB table in two different regions while maintaining the same configurations. The project leverages Terraform modules to encapsulate and reuse infrastructure code, uses multiple providers to deploy resources in different regions, and implements explicit dependencies between resources.

## Project Structure

The project structure is organized as follows:

|-- main.tf
|-- backend.tf
|-- variables.tf
|-- outputs.tf
|-- modules/
| |-- s3/
| |-- main.tf
| |-- variables.tf
| |-- outputs.tf
| |-- network/
| |-- main.tf
| |-- variables.tf
| |-- outputs.tf
| |-- ec2/
| |-- main.tf
| |-- variables.tf
| |-- outputs.tf
| |-- dynamodb/
| |-- main.tf
| |-- variables.tf
| |-- outputs.tf
|-- terraform.tfvars
|-- README.md

- **main.tf:** Defines the main infrastructure components and references modules.
- **backend.tf:** Configures the backend for storing the Terraform state file and implements locking.
- **variables.tf:** Defines input variables for the main module and modules.
- **outputs.tf:** Defines output values for the main module and modules.
- **modules/:** Directory containing Terraform modules for S3, network, EC2, and DynamoDB.
- **terraform.tfvars:** Variables file specifying values for the project.

## Usage

### Prerequisites

1. [Terraform](https://www.terraform.io/) installed.
2. AWS credentials configured with the necessary permissions.

### Configuration

1. Update `terraform.tfvars` with the desired values for your project.

2. Initialize Terraform:

    ```bash
    terraform init
    ```

3. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

4. Confirm the changes and enter `yes` when prompted.

## Variables

- **main.tfvars:** This file contains variables that define the configuration for the EC2 instance, S3 bucket, and DynamoDB table.

## Outputs

- The outputs of the main module and sub-modules, such as resource IDs and endpoint URLs, are displayed after Terraform applies the configuration.

## Cleanup

To destroy the deployed resources, run:

```bash
terraform destroy
