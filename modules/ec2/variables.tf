
variable "image" {
    description= "to define the ami of ec2 instance"
    type= string 
}

variable "instance_type" {
    description= "to define the instance_type of ec2 instance"
    default = "t2.micro"
    type= string 
}


variable "subnet_id" {
  description = "string"
  type = string
}



