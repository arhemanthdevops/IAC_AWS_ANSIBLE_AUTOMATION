#!/bin/bash

# Get user input for S3 bucket and DynamoDB table names
read -p "Enter the name for the S3 bucket: " s3_bucket_name
read -p "Enter the name for the DynamoDB table: " dynamodb_table_name

# Get user input for AWS region
read -p "Enter the AWS region for both S3 and DynamoDB (e.g., us-east-1): " region

# Create S3 bucket
aws s3api create-bucket --bucket "$s3_bucket_name" --region "$region"

# Create DynamoDB table
aws dynamodb create-table \
    --table-name "$dynamodb_table_name" \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region "$region"

echo "S3 bucket '$s3_bucket_name' and DynamoDB table '$dynamodb_table_name' created successfully in region '$region'."


