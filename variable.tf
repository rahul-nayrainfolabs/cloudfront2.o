variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "bucket" {
  type = string
}

variable "key" {
  type = string
}


variable "content_type" {
  type = string
}

variable "acl" {
  type = string
}

variable "tags" {
  type = string
}



variable "comment" {
  type = string
}

variable "s3_origin_id" {
  type = string
}

variable "enabled" {
  type = bool
}

variable "is_ipv6_enabled" {
  type = bool
}

variable "default_root_object" {
  type = string
}

variable "include_cookies" {
  type = bool
}

variable "allowed_methods" {
  type = list(string)
}

variable "cached_methods" {
  type = list(string)

}

variable "query_string" {
  type = bool
}

variable "forward" {
  type = string
}

variable "viewer_protocol_policy" {
  type = string
}

variable "min_ttl" {
  type = number
}

variable "default_ttl" {
  type = number
}

variable "max_ttl" {
  type = number
}

variable "price_class" {
  type = string
}

variable "restriction_type" {
  type = string
}

variable "locations" {
  type = list(string)
}

variable "cloudfront_default_certificate" {
  type = bool
}