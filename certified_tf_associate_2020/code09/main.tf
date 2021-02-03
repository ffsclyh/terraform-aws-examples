//Create two EIP in two different regions

resource "aws_eip" "eip-useast1" {
  vpc = true
  tags = {
    Name = "eip-useast1"
  }
}

resource "aws_eip" "eip-apsouth1" {
  vpc      = true
  provider = aws.mumbai
  tags = {
    Name = "eip-apsouth1"
  }
}
