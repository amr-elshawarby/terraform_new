module "s3" {
  source = "../modules/s3"
  amr_s3 = "amrinhooo"
}

# main.tf

module "vpc" {
  source                     = "../modules/network" # Replace with the actual path to your vpc_module
  vpc_ip                     = "10.0.0.0/16"
  public_subnet_cidr_blocks  = "10.0.1.0/24"
  private_subnet_cidr_blocks = "10.0.3.0/24"
}

module "ec2_example" {
  source    = "../modules/ec2"
  image     = "ami-006dcf34c09e50022"
  subnet_id = module.vpc.public
}
module "dunamo_db" {
  source = "../modules/dynamodb"
  amr_db = "amrdb"

}





