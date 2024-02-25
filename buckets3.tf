resource "aws_s3_bucket" "Bucket_S3-BerguellaMohammed" {

  bucket = "ynov-infracloud-berguellamohammed"
}

resource "aws_s3_object" "S3_Object_BerguellaMohammed" {
  bucket = aws_s3_bucket.Bucket_S3-BerguellaMohammed.id
  key    = "puppy.jpg"
  source = "assets/puppy.jpg"

}

resource "aws_s3_bucket_public_access_block" "name" {
  bucket = aws_s3_bucket.Bucket_S3-BerguellaMohammed.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = [aws_s3_bucket.Bucket_S3-BerguellaMohammed.arn, "${aws_s3_bucket.Bucket_S3-BerguellaMohammed.arn}/*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "Bucket_S3_Policy-BerguellaMohammed" {
  bucket     = aws_s3_bucket.Bucket_S3-BerguellaMohammed.id
  depends_on = [aws_s3_bucket_public_access_block.name]

  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

/*
resource "aws_s3_bucket_policy" "Bucket_S3_Policy-BerguellaMohammed" {

    bucket = aws_s3_bucket.Bucket_S3-BerguellaMohammed.id
    policy = data.aws_iam_policy_document.allow_access_from_another_account.json

}

data "aws_iam_policy_document" "allow_access_from_another_account" {
    statement {
      principals {
        type = "AWS"
        identifiers = ["*"]
      }

      actions = [
        "s3:GetObject",
        "s3:ListBucket",
      ]
      resources = [
        aws_s3_bucket.Bucket_S3-BerguellaMohammed.arn,
        "${aws_s3_bucket.Bucket_S3-BerguellaMohammed.arn}/*",
      ]
    }
}*/