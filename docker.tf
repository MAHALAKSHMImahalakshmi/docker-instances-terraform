resource "aws_instance" "docker" {
  ami           = local.ami_id
  #instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_docker.id]
  instance_type = "t3.medium"
  # need more for terraform
  root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
  user_data = file("docker.sh")
  #iam_instance_profile = "TerraformAdmin"
  tags = {
     Name = "${var.project}-${var.environment}-docker"
  }
}
