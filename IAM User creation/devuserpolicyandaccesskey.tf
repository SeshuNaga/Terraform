resource "aws_iam_user" "dev_user" {
    name ="dev_user"
  
}
output "aws_iam_user" {
   value = aws_iam_user.dev_user
  
}
resource "aws_iam_user_policy_attachment" "test" {
    user = aws_iam_user.dev_user.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
    
  
}

resource "aws_iam_access_key" "test" {
    user = aws_iam_user.dev_user.name

  
}

output "aws_iam_access_key" {
    value = aws_iam_access_key.test
     sensitive = true

  
}