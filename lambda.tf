# Add IAM Role
resource "aws_iam_role" "lambda_role" {
  name               = "Lambda_Function_Role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "lambda.amazonaws.com"
                ]
            }
        }
    ]
}
EOF
}


# Add IAM Policy
resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "iam_policy_for_lambda_role_ses"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ses:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::terraform-s3-bucket-26.04.2024-src-bucket",
                "arn:aws:s3:::terraform-s3-bucket-26.04.2024-src-bucket/*"
            ]
        }
    ]
}
EOF
}

# Attach IAM Policy to IAM Role
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}


# Create a ZIP of Python Application
data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/ses-python.zip"
}

# Add aws_lambda_function Function
resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = "${path.module}/python/ses-python.zip"
  function_name = "Lambda_Function_SES"
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}


# Event Trigger
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "terraform-s3-bucket-26.04.2024"

  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*", "s3:ObjectRemoved:*"]
  }
}

# Permission to trigger the Lambda function
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket1"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::terraform-s3-bucket-26.04.2024"
}



