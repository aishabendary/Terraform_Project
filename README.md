# Terraform Infrastructure Deployment for AWS 

This project aims to automate the deployment of networking and compute resources on Amazon Web Services (AWS) using Terraform. It provides a modular and scalable approach to provisioning infrastructure for different environments such as development (dev) and production (prod).

## Table of Contents 📌
* Introduction
* Features
* Prerequisites
* Usage
* Variables
* Modules
* Remote State and Locking
* Email Notification
* Deployment
* Monitoring
* 

## Introduction ⬇️
This project leverages Terraform to automate the provisioning of networking and compute resources on AWS. It follows best practices such as infrastructure-as-code (IaC) and modularization to achieve infrastructure consistency, scalability, and reliability.


## Features ✔️
* **Networking:** Creates a Virtual Private Cloud (VPC), Internet Gateway, NAT Gateway, subnets (public and private), and route tables.
* **Compute:** Deploys EC2 instances (bastion and application) with security groups allowing SSH access.
* **Workspaces:** Sets up separate workspaces for development and production environments.
* **Variables:** Utilizes variable definition files for environment-specific configurations.
* **Modules:** Organizes network resources into reusable modules for easier management and maintenance.
* **Remote State and Locking:** Stores Terraform state remotely and enables state locking to prevent concurrent modifications.
* **Email Notification:** Integrates AWS Simple Email Service (SES) to send email notifications for infrastructure changes.
* **RDS and ElastiCache:** Provides options for deploying RDS (Relational Database Service) and ElastiCache (Elastic Cache) for database and caching requirements.
* **GitHub Integration:** Uploads infrastructure code to a GitHub repository for version control and collaboration.
* 

## Prerequisites 🔔
**Before using this project, ensure you have the following prerequisites:**

AWS account with appropriate permissions to create resources.
Terraform installed on your local machine.
AWS CLI configured with access keys for programmatic access.
Verified email address for AWS SES email notifications.


## Usage 🗺️
**Follow these steps to deploy infrastructure using Terraform:**

1. Clone this repository to your local machine.
2. Navigate to the project directory.
3. Modify the variable definition files (dev.tfvars and prod.tfvars) with your environment-specific configurations.
4. Run terraform init to initialize the project.
5. Run terraform plan -var-file=dev.tfvars or terraform plan -var-file=prod.tfvars to review the execution plan.
6. Run terraform apply -var-file=dev.tfvars or terraform apply -var-file=prod.tfvars to apply the changes and deploy the infrastructure.
7. After deployment, verify the resources on the AWS Management Console.
8. 

## Variables 
Customize the variables in the .tfvars files according to your environment requirements. Refer to the comments in the files for guidance on each variable.

## Modules 
Modularize your infrastructure by utilizing the modules provided in the modules/ directory. Each module encapsulates related resources and configurations for better organization and reusability.

## Remote State and Locking 
Store Terraform state remotely using a backend of your choice (e.g., AWS S3) and enable state locking to prevent concurrent modifications. Update the backend.tf file with your backend configuration.

## Email Notification 
Integrate AWS SES for email notifications by verifying your email address and updating the email_notification.tf file with the appropriate configurations.

## Deployment 
Deploy the infrastructure by following the usage instructions provided above. Ensure that you have the necessary permissions and configurations in place before running Terraform commands.

## Monitoring 
Monitor your infrastructure using AWS CloudWatch or other monitoring tools. Set up alarms and notifications to stay informed about resource utilization and performance.
