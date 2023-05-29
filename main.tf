provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "baalti" {
  bucket        = var.bucket
  force_destroy = true
  tags = {
    Name = var.tags
  }
}


resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.baalti.id
  key          = var.key
  source       = "/home/nay/work/deep-cloudfront/index.html"
  content_type = var.content_type
  acl          = var.acl
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.baalti.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["728643735238"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.baalti.arn,
      "${aws_s3_bucket.baalti.arn}/*",
    ]
  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.baalti.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.baalti.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.baalti.id
  acl    = "log-delivery-write"
}
###########################################################################################
resource "aws_cloudfront_origin_access_identity" "my-oai" {
  comment = var.comment
}
resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.baalti.id
  acl    = "log-delivery-write"
}

##########################################################################################



resource "aws_s3_bucket_policy" "prod_website" {
  bucket = aws_s3_bucket.baalti.id
  policy = <<POLICY
 
 {
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "PublicRead",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::728643735238:role/mys3role"
            },
            "Action": ["s3:GetObject"],
            "Resource": "arn:aws:s3:::xuv7000/*"
        }
    ]
}
POLICY
}


###################################################################################
#i created iam role and used its ARN # and id
###################################################################################

locals {
  s3_origin_id = var.s3_origin_id
}
