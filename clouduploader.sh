#!/bin/bash
###############################################
#author: sirronney@cloudev
#date: fri aug 30
#use: cloudUploader CLI - azure storage
#version: v1.0
###############################################

# Check if a file path is provided
if [ -z "$1" ]; then
    echo "Usage: clouduploader /path/to/file"
    exit 1
fi

FILE=$1

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File not found!"
    exit 2
fi

# Create Azure storage account (only run this once, or if you need to recreate the account)
az storage account create --name cliuploader --resource-group rg-cliuploader --location eastus --sku Standard_LRS

# Create container in the storage account
az storage container create --name cliuploadercontainer --account-name cliuploader

# Set the container to public access level
az storage container set-permission --name cliuploadercontainer --account-name cliuploader --public-access container

# Retrieve the connection string for your storage account
CONNECTION_STRING=$(az storage account show-connection-string --name cliuploader --resource-group rg-cliuploader --output tsv)

# Export connection string for use in upload command
export AZURE_STORAGE_CONNECTION_STRING="$CONNECTION_STRING"

# Upload to Azure Blob Storage with progress bar
pv "$FILE" | az storage blob upload --account-name cliuploader --container-name cliuploadercontainer --name "$(basename $FILE)" --overwrite --file-

# Generate a SAS token for the blob
SAS_TOKEN=$(az storage blob generate-sas --account-name cliuploader --container-name cliuploadercontainer --name "$(basename $FILE)" --permissions r --expiry $(date -d '+1 day' -u +"%Y-%m-%dT%H:%MZ") --output tsv)

# Construct the shareable URL
SHAREABLE_URL="https://cliuploader.blob.core.windows.net/cliuploadercontainer/$(basename $FILE)?$SAS_TOKEN"

# Display the shareable URL
echo "Shareable link: $SHAREABLE_URL"

# Check for successful upload
if [ $? -eq 0 ]; then
    echo "File uploaded successfully to Azure Blob Storage"
else
    echo "File upload failed."
    exit 1
fi

