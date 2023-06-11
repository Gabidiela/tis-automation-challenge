module "instance" {
  source = "./Modules/EC2"

  project_name = var.variables_ec2.project_name

  vpc_id = var.variables_ec2.vpc_id
  subnet_id = var.variables_ec2.subnet_id
  instance_ubuntu = var.variables_ec2.instance_ubuntu
  instance_windows = var.variables_ec2.instance_windows
  volume_settings   = var.variables_ec2.volume_settings
}