variable "instance_name" {
    description = "Instance Name"
    type = string
    default = "app_server"
}

variable "image_name" {
    description = "AMI name "
    type = string
    default = "ami-830c94e3"

    validation {
        condition     = length(var.image_name) > 4 && substr(var.image_name, 0, 4) == "ami-"
        error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
    }
}

variable "az_names" {
    type = list(string)
    default = [ "us-west-1a", "us-west-1b", "us-west-1c" ]
}

variable "default_security_group" {
    type = list(object({
        in_type = string
        in_protocol = string
        in_port = number
        in_source = string
        in_source_value = string
    })) 
  
    default = [ {
      in_port = 22
      in_protocol = "TCP"
      in_source = "Custom"
      in_source_value = "0.0.0.0/0"
      in_type = "SSH"
    } ]
}

