# Creation-of-EKS-Cluster-using-Terraform-and-Jenkins

- Launching a Jenkins VM on AWS  
- Installing required tools  
- Configuring IAM and credentials  
- Writing Terraform infrastructure code  
- Creating a Jenkins pipeline  
- Deploying and verifying an EKS cluster


## Tech Stack

- AWS EC2  
- Amazon EKS  
- Terraform  
- Jenkins  
- AWS CLI  
- kubectl  
- IAM  

## Architecture Overview

1. Jenkins runs on an EC2 VM.
2. Jenkins executes Terraform via pipeline stages.
3. Terraform provisions:
   - VPC & networking
   - EKS control plane
   - Worker nodes
4. kubectl validates cluster creation.

## Step-by-Step Setup


## Launch Jenkins VM

Create an EC2 instance with:

- OS: Ubuntu 22.04 / 24.04  
- Instance Type: `t2.medium` or higher  
- Storage: 30 GB  
- Security Group:
  - TCP 22 (SSH)
  - TCP 8080 (Jenkins)

## 2️⃣ Install Required Tools on VM

SSH into the instance and install:

### Java & Jenkins, Terraform, AWS CLI, Kubectl

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins

======================================

### Terraform

wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform -v


### Kubectl

curl -LO https://dl.k8s.io/release/$(curl -L -s \
https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

### AWS CLI

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip awscliv2.zip
sudo ./aws/install
aws --version




