variable "region" {
  type        = string
  description = "The AWS region"
}

variable "lambda_authorizer_filename" {
  description = "The filename of the Lambda authorizer zip file."
  type        = string
}
