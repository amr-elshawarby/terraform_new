# Configue the ec2 resource
resource "aws_instance" "my-ec2"{
    ami= var.image
    instance_type= var.instance_type
    subnet_id = var.subnet_id
}
     