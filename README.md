# AWS DevOps Project – Terraform ALB Architecture

This project demonstrates the deployment of a highly available web application on AWS using Terraform.

## 🚀 Project Overview

The infrastructure is fully provisioned using Infrastructure as Code (Terraform) and includes a complete AWS networking and load balancing setup.

## 🏗️ Architecture

- Custom VPC (CIDR: 172.120.0.0/16)
- Public Subnets (for ALB)
- Private Subnets (for EC2 instances)
- Internet Gateway for public access
- NAT Gateway for outbound access from private instances
- Application Load Balancer (ALB)
- EC2 Instances running Apache web server
- Security Groups controlling traffic flow

## ⚙️ Features

- High availability across multiple Availability Zones
- Load balancing across multiple EC2 instances
- Private instances not directly exposed to the internet
- Dynamic response showing hostname and instance ID
- Fully automated deployment using Terraform

## 📸 Demo

The application is served through an Application Load Balancer.  
Each refresh routes traffic to a different EC2 instance, demonstrating load balancing.

## 🛠️ Technologies Used

- AWS (EC2, VPC, ALB, NAT Gateway)
- Terraform
- Linux (Amazon Linux)
- Apache (httpd)

## 📦 Project Structure
