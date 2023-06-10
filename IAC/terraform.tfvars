vpc_name = "tis-automation"

region = "us-east-1"

profile = "default"

variables_ec2 = {
  instance_ubuntu = {
    instance_ami  = "ami-053b0d53c279acc90" # linux v2 ami-03c7d01cf4dedc891 x86, ami-0c5338a495eb1c939 arm64
    instance_type = "t2.micro"  # "t4g.medium" "t3.medium"
    key_pair_name = "tis-automation"
    script_file_path = "scripts"
    script_file_name = "ansible-config.sh"
  }

  instance_windows = {
    instance_ami  = "ami-0004b72b3e1ba55f6" 
    instance_type = "t2.micro"  # "t4g.medium" "t3.medium"
    key_pair_name = "tis-automation"
    script_file_path = "scripts"
    script_file_name = "ansible-config.cmd"
  }
  volume_settings = {
    volume_size       = 30
    volume_type       = "gp2"
  }
}