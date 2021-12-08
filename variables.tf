variable "backend_bucket" {
  type        = string
  description = "Backend S3 Bucket"
}

variable "region" {
  type        = string
  description = "The region to deploy in"
  default     = "ap-southeast-2"
}

variable "project_name" {
  type        = string
  description = "The name of the project that this app is apart of."
  default     = "jenkins"
}

variable "key_name" {
  type        = string
  description = "SSH key for instances."
}
