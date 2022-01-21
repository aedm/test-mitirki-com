#!/bin/bash

: ${AWS_S3_BUCKET:?"Required: AWS_S3_BUCKET"}
: ${AWS_CLOUDFRONT_DISTRIBUTION:?"Required: AWS_CLOUDFRONT_DISTRIBUTION"}

aws s3 rm s3://${AWS_S3_BUCKET} --recursive
aws s3 cp dist s3://${AWS_S3_BUCKET}/ --recursive
aws cloudfront create-invalidation --distribution-id ${AWS_CLOUDFRONT_DISTRIBUTION} --paths "/*"