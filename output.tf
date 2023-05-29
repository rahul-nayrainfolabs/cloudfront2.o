output "cloudfront_distribution_id" {
  description = "The identifier for the distribution."
  value       = aws_cloudfront_distribution.s3_distribution.id
}

output "cloudfront_distribution_arn" {
  description = "The ARN (Amazon Resource Name) for the distribution."
  value       = aws_cloudfront_distribution.s3_distribution.arn
}

