resource "aws_s3_bucket" "static_page" {
  bucket = var.bucketname

}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.static_page.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

 resource "aws_s3_bucket_public_access_block" "example1" {
  bucket = aws_s3_bucket.static_page.id

   block_public_acls       = false
   block_public_policy     = false
   ignore_public_acls      = false
   restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example1,
  ]

  bucket = aws_s3_bucket.static_page.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.static_page.id
  key    = "index.html"
  source = "index.html"

  content_type = "text/html"
}



resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.static_page.id
  key    = "error.html"
  source = "error.html"

  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "static-hosting" {
  bucket = aws_s3_bucket.static_page.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}


