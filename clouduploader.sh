#!/bin/bash
###############################################
#author: sirronney@cloudev
#date: fri aug 30
#use: cloudUploader CLI - azure storage
#version: v1.0
###############################################


#check if a file path is provided
if [ -z "$1" ]
then
	echo "Usage: clouduploader /path/to/file"
	exit 1
fi

FILE=$1

#check if the file exists
if [ ! -f "$FILE"]
then
	echo "File not found!"
	exit 2
fi

#create azure storage account 
az storage account create --name cliuploader --resource-group rg-cliuploader --location eastus --sku Standard_LRS

#create container in the storage account

az storage container create --name cliuploadcontainer --account-name cliuploader

#retrieve the connection string for your storage account
az storage account show-connection-string --name cliuploader --resource-group rg-cliuploader

#store this connection in an env variable for use in your script

export AZURE_STORAGE_CONNECTION_STRING="az storage account show-connection-string --name cliuploader --resource-group
rg-cliuploader
"

#upload to azure blob storage

az storage blob upload --account-name cliuploader --container-name cliuploadercontainer --file "$FILE" --name "$(basename $FILE)"

if [ $? -eq 0 ]
then 
	echo "File uploaded successfully to azure blob storage"
else
	echo "file upload failed."
	exit 1
fi




