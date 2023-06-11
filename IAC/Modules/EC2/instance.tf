resource "aws_instance" "ubuntu_instance_1" {
    ami           = var.instance_ubuntu.instance_ami
    instance_type = var.instance_ubuntu.instance_type
    key_name      = var.instance_ubuntu.key_pair_name

    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

    root_block_device {
        volume_size           = var.volume_settings.volume_size
        volume_type           = var.volume_settings.volume_type
        delete_on_termination = true
        encrypted             = true
    }

    user_data = "${path.module}/${var.instance_ubuntu.script_file_path}/${var.instance_ubuntu.script_file_name}"

    tags = {
        Name = format("%s-ubuntu-1", var.project_name)
    }
}

# resource "aws_instance" "ubuntu_instance_2" {
#     ami           = var.instance_ubuntu.instance_ami
#     instance_type = var.instance_ubuntu.instance_type 
#     key_name      = var.instance_ubuntu.key_pair_name

#     subnet_id = var.subnet_id
#     vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

#     root_block_device {
#         volume_size           = var.volume_settings.volume_size
#         volume_type           = var.volume_settings.volume_type
#         delete_on_termination = true
#         encrypted             = true
#     }

#     user_data = "${path.module}/${var.instance_ubuntu.script_file_path}/${var.instance_ubuntu.script_file_name}"

#     tags = {
#         Name = format("%s-ubuntu-2", var.project_name)
#     }
# }

# resource "aws_instance" "windows_instance_1" {
#     ami           = var.instance_windows.instance_ami
#     instance_type = var.instance_windows.instance_type
#     key_name      = var.instance_windows.key_pair_name

#     subnet_id = var.subnet_id
#     vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

#     root_block_device {
#         volume_size           = var.volume_settings.volume_size
#         volume_type           = var.volume_settings.volume_type
#         delete_on_termination = true
#         encrypted             = true
#     }

#     user_data = "${path.module}/${var.instance_windows.script_file_path}/${var.instance_windows.script_file_name}"

#     tags = {
#         Name = format("%s-windows-1", var.project_name)
#     }
# }

# resource "aws_instance" "windows_instance_2" {
#     ami           = var.instance_windows.instance_ami
#     instance_type = var.instance_windows.instance_type
#     key_name      = var.instance_windows.key_pair_name

#     subnet_id = var.subnet_id
#     vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

#     root_block_device {
#         volume_size           = var.volume_settings.volume_size
#         volume_type           = var.volume_settings.volume_type
#         delete_on_termination = true
#         encrypted             = true
#     }

#     user_data = "${path.module}/${var.instance_windows.script_file_path}/${var.instance_windows.script_file_name}"

#     tags = {
#         Name = format("%s-windows-2", var.project_name)
#     }
# }
