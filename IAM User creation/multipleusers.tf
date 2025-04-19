provider "aws" {
  region = "us-east-1"
}

variable "iam_users" {
  default = ["seshu", "naga", "bommineni"]
}

# Create IAM users
resource "aws_iam_user" "users" {
  for_each = toset(var.iam_users)
  name     = each.value
}

# Create IAM group
resource "aws_iam_group" "multiplegroup" {
  name = "multiplegroup"
}

# Attach policy to group
resource "aws_iam_group_policy_attachment" "multiplegroup_policy" {
  group      = aws_iam_group.multiplegroup.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

# Add users to the group
resource "aws_iam_user_group_membership" "group_membership" {
  for_each = toset(var.iam_users)

  user   = aws_iam_user.users[each.value].name
  groups = [aws_iam_group.multiplegroup.name]
}
