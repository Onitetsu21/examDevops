data "aws_ec2_instance_type_offering" "t2_nano" {
  filter {
    name= "instance-type"
    values= ["t2.nano"]
  }
}

data "aws_ami" "ubuntu_bionic" {
    owners= ["099720109477"]
    most_recent = true
    name_regex = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
    
    filter {
      name = "architecture"
      values = ["x86_64"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}

