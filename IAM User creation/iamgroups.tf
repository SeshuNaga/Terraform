resource "aws_iam_group" "devopsgroup" {
    name = "devopsgroup"
  
}

resource "aws_iam_policy_attachment" "devopsgroup" {
    name = aws_iam_group.devopsgroup.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
    groups = [ aws_iam_group.devopsgroup.name]
  
}