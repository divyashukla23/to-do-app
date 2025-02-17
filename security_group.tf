resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = data.aws_vpc.default_vpc.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}
resource "aws_security_group" "node_group_two" {
  name_prefix = "node_group_two"
  vpc_id      = data.aws_vpc.default_vpc.id
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}