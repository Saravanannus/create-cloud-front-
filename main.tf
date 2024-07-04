provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = "sctp-staticwebsite-files.s3.ap-southeast-1.amazonaws.com"
        origin_id                = "sctp-staticwebsite-files"
  }
   enabled             = true
  is_ipv6_enabled     = true
}
default_cache_behavior {
    allowed_methods  = [ "GET"]
    cached_methods   = ["HEAD"]
    target_origin_id = local.sctp-staticwebsite-files

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
}