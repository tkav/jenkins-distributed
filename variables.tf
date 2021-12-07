variable "region" {
  type        = string
  description = "The region to deploy in"
  default     = "ap-southeast-2"
}

variable "project_name" {
  type        = string
  description = "The name of the project that this app is apart of."
  default     = "tkav-jenkins"
}

variable "key_name" {
  type        = string
  description = "SSH key for instances."
  default     = "tkav-contino-dev"
}
