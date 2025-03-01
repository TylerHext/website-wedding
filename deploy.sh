#!/bin/bash

# Variables
BUCKET_NAME=${1:-${BUCKET_NAME}}
LOCAL_DIR=${2:-${LOCAL_DIR:-"."}}

# Check if BUCKET_NAME is set
if [ -z "$BUCKET_NAME" ]; then
  echo "Error: BUCKET_NAME is not set."
  echo "Usage: $0 <bucket-name> [local-dir]"
  exit 1
fi

# Sync local directory with S3 bucket
echo "Deploying website to S3..."
aws s3 sync $LOCAL_DIR s3://$BUCKET_NAME --delete --exclude ".*" --exclude "deploy.sh"

if [ $? -eq 0 ]; then
  echo "Deployment successful!"
else
  echo "Deployment failed."
  exit 1
fi