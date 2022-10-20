data "archive_file" "mail" {
  type        = "zip"
  source_file = "lambda/python.py"
  output_path = "lambda/outputs/python.zip"
}
