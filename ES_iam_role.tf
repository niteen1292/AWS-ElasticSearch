resource "aws_iam_role" "ES-role" {
  name               = "ES-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_instance_profile" "ES_profile" {
  name = "ES_profile"
  role = "${aws_iam_role.ES-role.name}"
}
resource "aws_iam_role_policy" "ES_policy" {
  name   = "ES_policy"
  role   = "${aws_iam_role.ES-role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
