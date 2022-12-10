terraform {
  required_providers { 
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {          
  ami           = "ami-0574da719dca65348"        #imagem do sistema
  instance_type = "t2.micro"                     #tipo de instancia
  key_name = "iac-instancia"                     #associa a chave a instancia
  #user_data = <<-EOF
  #          #!/bin/bash
  #          cd /home/ubuntu
  #          echo "<h1>FEITO<"h1>" > index.html
  #          nohup busybox httpd -f -p 8080 &
  #          EOF
  tags = {
    Name = "TERRAORM ANSIBLE PYTHON"              #nome para identificar a instancia
  }
}
