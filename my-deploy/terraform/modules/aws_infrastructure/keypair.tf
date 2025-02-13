### Key pair file
resource "aws_key_pair" "prod_ssh_keypair" {
  key_name   = "${var.ec2_instance_name}_key_pair"
  public_key = file(var.ssh_pubkey_file)
  tags = {
    Name = "prod_ssh_keypair"
  }
}
