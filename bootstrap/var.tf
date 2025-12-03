variable "dynamodb_table_name" {
  type = string
  default = "fctc-dd-table"
}

variable "bucket_name" {
  type = string
  default = "fctc-s3-bucket-for-tf-state"
}

variable "region" {
type = string
 default = "us-east-1" 
}

