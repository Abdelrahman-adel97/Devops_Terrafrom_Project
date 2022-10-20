resource "aws_ses_email_identity" "sender-email" {
  email = "abdelrahman.adel.saber@gmail.com"
}

resource "aws_ses_email_identity" "receiver-email" {
  email = "abdelrahman19.adel@gmail.com"
}
