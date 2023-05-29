resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.baalti.bucket_regional_domain_name
    origin_id   = local.s3_origin_id
  }

  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object

  logging_config {
    include_cookies = var.include_cookies
    bucket          = "xuv7000.s3.amazonaws.com"
  }


  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = var.query_string

      cookies {
        forward = var.forward
      }
    }

    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.min_ttl
    default_ttl            = var.default_ttl
    max_ttl                = var.max_ttl
  }




  price_class = var.price_class


  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.locations
    }
  }



  viewer_certificate {
    cloudfront_default_certificate = var.cloudfront_default_certificate
  }
}




