module "s3" {
  source = "../modules/s3"
  amr_s3 = "amrinhoooo"
}

# main.tf

module "vpc" {
  source                     = "../modules/network" # Replace with the actual path to your vpc_module
  vpc_ip                     = "10.0.0.0/16"
  public_subnet_cidr_blocks  = "10.0.2.0/24"
  private_subnet_cidr_blocks = "10.0.4.0/24"
}

module "ec2_example" {
  source    = "../modules/ec2"
  image     = "ami-0fc3317b37c1269d3"
  subnet_id = module.vpc.public
}
module "dunamo_db" {
  source = "../modules/dynamodb"
  amr_db = "amrdb"

}





