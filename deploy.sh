#!/bin/bash

# Variables
BUCKET_NAME="www.mathildeandtyler.com"
LOCAL_DIR="."

# Sync local directory with S3 bucket
echo "Deploying website to S3..."
aws s3 sync $LOCAL_DIR s3://$BUCKET_NAME --delete --exclude ".*" --exclude "deploy.sh"

if [ $? -eq 0 ]; then
  echo "Deployment successful!"
else
  echo "Deployment failed."
  exit 1
fi
