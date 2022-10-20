resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda/outputs/python.zip"
  function_name = "mail"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "python.lambda_handler"
  runtime       = "python3.8"
}
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = file("lambda/assume_role_policy.json")
}

resource "aws_iam_role_policy" "lambda_policy" {
  name   = "lambda_policy"
  role   = aws_iam_role.iam_for_lambda.id
  policy = file("lambda/policy.json")
}

