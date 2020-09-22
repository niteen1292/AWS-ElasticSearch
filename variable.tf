variable "elasticsearch_master_key_name" {
  description = "aws key pair for elasticsearch_master server"
  type        = "string"
}

variable "elasticsearch_master_server_ami" {
  description = "ID of AMI to use for the elasticsearch_master-server instance"
  type        = "string"
}


variable "Subnet_id" {
  description = "provide subnet id"
  type        = "string"
}

variable "vpc_id" {
  description = "provide vpc id"
  type        = "string"
}

variable "elasticsearch_Masterhostname" {
  description = "Provide tag name"
  type        = "string"
}


variable "elasticsearch_master_server_instance_type" {
  description = "The type of instance for elasticsearch_master server"
  type        = "string"
}

variable "Elasticsearch_External_Volume_Size" {
  description = "Define External_Volume_Size"
  type        = "string"
}
variable "associate_public_ip_address" {
  description = "Define associate_public_ip_address"
  type        = "string"
}
variable "es_region" {
  description = "Define region for ES Node"
  type        = "string"
}
variable "ES_tags" {
  description = "Additional tags"
   type        = "map"
   default = {
   Monitor      = "ES_tags"
}
}

