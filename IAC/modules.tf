module "network" {
  source = "./Modules/Network"

  vpc_name = var.vpc_name
  region = var.region
}

module "instance" {
  source = "./Modules/EC2"

  vpc_name = var.vpc_name

  vpc_id = module.network.vpc_id
  private_subnet_1a = module.network.private_subnet_1a
  instance_ubuntu = var.variables_ec2.instance_ubuntu
  instance_windows = var.variables_ec2.instance_windows
  volume_settings   = var.variables_ec2.volume_settings
}