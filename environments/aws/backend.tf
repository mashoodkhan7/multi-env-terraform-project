terraform {
  backend "s3" {
    bucket         = "fctc-s3-bucket-for-tf-state"  
    key            = "dev/aws/terraform.tfstate"    # path inside the bucket
    region         = "us-east-1"
    dynamodb_table = "fctc-dd-table"               # your DynamoDB table for locking
    encrypt        = true
  }
}
