terraform {
  backend "s3" {
    bucket = "iacawsproject1"
    key = "project_terra/terraform.tfstate"
    region = "ap-southeast-1b"
    dynamodb_table = "bigdb"
    
  }
}
