resource "aws_instance" "webapp-poc" {
  count         = 1
  ami           = "ami-0f3d9639a5674d559"
  instance_type = "t2.micro"
  key_name      = "test1"
  
  tags = {
    Name  = "gittest"    
  }
}