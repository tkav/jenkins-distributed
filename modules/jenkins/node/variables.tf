variable "security_groups" {
  type        = list(string)
  description = "Security groups for instance."
}

variable "project_name" {
  type        = string
  description = "The name of the project that this app is apart of."
}

variable "instance_size" {
  type        = string
  description = "Size of instance. eg. 't3.micro'."
}

variable "node_count" {
  type        = number
  description = "Number of Jenkins Nodes."
}

variable "key_name" {
  type        = string
  description = "SSH key for instances."
}
