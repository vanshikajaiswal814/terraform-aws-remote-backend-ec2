# Terraform AWS Infrastructure with Remote Backend

## 📌 Project Overview

This project demonstrates how to provision AWS infrastructure using Terraform with a **remote backend configuration**.

The remote backend stores Terraform state in Amazon S3 and implements state locking using DynamoDB to support safe collaboration in team environments.

## 🧰 Technologies Used

* Terraform
* Amazon Web Services (AWS)
* Amazon EC2
* Amazon S3
* Amazon DynamoDB
* Git & GitHub

## 🏗 Architecture

This project creates:

* An S3 bucket for Terraform remote state storage
* A DynamoDB table for state locking
* Two EC2 instances in the development environment

## 📂 Project Structure

```
terraform-project
│
├── remote-backend
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── environments
│   └── dev
│       ├── backend.tf
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       └── outputs.tf
```

### remote-backend

This directory provisions the infrastructure required for Terraform remote state:

* S3 bucket for storing Terraform state files
* DynamoDB table for state locking

### environments/dev

This directory contains the actual infrastructure configuration for the development environment, including:

* Remote backend configuration
* EC2 instance provisioning

## ⚙️ Terraform Remote Backend

The remote backend uses:

* Amazon S3 for state file storage
* DynamoDB for state locking

Benefits:

* Prevents state corruption
* Supports team collaboration
* Maintains state history using versioning

## 🚀 Deployment Steps

### 1. Clone Repository

```
git clone https://github.com/vanshikajaiswal814/terraform-aws-remote-backend-ec2.git
cd terraform-project
```

### 2. Deploy Backend Infrastructure

Navigate to the remote-backend directory:

```
cd remote-backend
terraform init
terraform apply
```

This will create:

* S3 bucket for Terraform state
* DynamoDB table for state locking

### 3. Deploy Development Infrastructure

Navigate to the dev environment:

```
cd ../environments/dev
terraform init
terraform plan
terraform apply
```

This will create two EC2 instances using Terraform.

## 📊 Outputs

Terraform will output:

* EC2 Instance IDs
* Public IP addresses
* Private IP addresses
* Instance names

## 🔒 State Management

Terraform state is stored remotely in an S3 bucket with:

* Versioning enabled
* Server-side encryption enabled

DynamoDB ensures safe state locking during concurrent Terraform operations.

## 🧹 Destroy Infrastructure

To destroy infrastructure:

```
terraform destroy
```

Run the command from the respective directory.

## 📚 Key Learning Outcomes

* Terraform remote backend setup
* Infrastructure as Code (IaC) best practices
* State management using S3
* State locking using DynamoDB
* Multi-environment Terraform project structure
* AWS infrastructure provisioning

## Multiple environments supported
dev
staging
prod

Each environment can have separate state files in the same S3 bucket.
s3 bucket
│
├── dev/ec2/terraform.tfstate
├── staging/ec2/terraform.tfstate
└── prod/ec2/terraform.tfstate

## Author

Created as part of a DevOps learning project using Terraform and AWS.
