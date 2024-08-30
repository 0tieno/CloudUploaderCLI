# CloudUploader CLI

## What is this `CloudUploader CLI`?

The `CloudUploader CLI` is a bash script designed for uploading files to Azure Blob Storage. It provides a command-line interface to create an Azure storage account, upload files, and generate shareable links with ease.

## Prerequisites

Before using the `CloudUploader CLI`, ensure that you have the following:

1. **Azure CLI**: Ensure that the Azure CLI is installed and configured. You can download it from [Azure CLI Installation](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
2. **`pv` Tool**: Install the `pv` tool for displaying progress during file uploads. Install it using:

   ```bash
   sudo apt-get install pv
   ```

## Installation

1. Clone the Repository: Clone the repository containing the clouduploader.sh script.

    ```bash
    git clone https://github.com/0tieno/CloudUploaderCLI.git
    ```

2. Navigate to the Directory: Change to the directory where the script is located.

    ```bash
    cd CloudUploaderCLI
    ```

3. Make the Script Executable: Make the script executable using the following command:

    ```bash
    chmod +x clouduploader.sh
    ```

## USAGE

To upload a file to Azure Blob Storage, use the following command:
  
```bash
./clouduploader.sh /path/to/your/file
```

To upload a file to a specific container:

```bash
./clouduploader.sh /path/to/your/file my-container
```

## Advanced Features

1. **Public Access**: The script sets the container to public access, allowing anyone with the shareable link to access the file.

2. **Progress Bar**: The pv tool is used to display a progress bar during the file upload, providing a visual indication of the upload progress.

3. **Shareable Link**: After a successful upload, the script generates a shareable URL with a SAS token, which provides temporary access to the uploaded file.

## Troubleshooting

1. **File Not Found Error**: If you receive a "File not found!" error, ensure that the file path provided exists and is correct.

2. `pv` **Command Not Found:** If you get an error about `pv`, ensure that it is installed correctly. You can install it using:

    ```bash
    sudo apt-get install pv
    ```

3. **Azure CLI Login**: If you encounter an error related to Azure CLI login, ensure that you are logged in using:

    ```bash
    az login
    ```

4. **Permissions Issues:** If the script fails due to permission issues, check that you have appropriate permissions to create resources in your Azure subscription.

5. **Blob Already Exists:** If the file already exists in the container, the script will fail. You can add the --overwrite flag to replace the existing file.

## Conclusion

If you have any issues or questions, please refer to the troubleshooting section or reach out for assistance. You can also fork the repository and contribute to the project by adding new features or improving existing ones.

---

## Objective(if you want to create a similar tool)

Create a command-line interface (CLI) tool in Bash that allows users to easily upload files to a specified cloud storage provider (e.g., AWS S3, Google Cloud Storage, Azure Blob Storage).

## Key Steps

1. GitHub Repository Setup:
   - Create a GitHub repository for the project.
   - Use branches for feature development and commit your changes frequently.
   - Familiarize yourself with essential Git commands: `git init`, `git add`, `git commit`, `git branch`, `git push`, etc.

2. Setup & Authentication:
   - Choose a cloud storage provider (e.g., AWS S3, Google Cloud Storage, Azure Blob Storage).
   - Implement secure authentication methods, such as `az login` for Azure.
   - Avoid hardcoding credentials. Use environment variables or secured configuration files for storing credentials.
   - Utilize the cloud provider's best practices for secure authentication (e.g., IAM roles for AWS, service principals for Azure).

3. CLI Argument Parsing:
    - Use Bash's built-in positional parameters (`$1`, `$2`, etc.) to handle command-line arguments.
    - Main Argument: The first argument should be the file path (e.g., `/path/to/file.txt`).
    - Additional Arguments (Optional): Allow users to specify additional arguments like target cloud directory or storage class.
    - Input Validation: Ensure that the file path is valid and check additional arguments for correctness. Provide clear error messages if inputs are invalid.

4. File Existence Check:
    - Before attempting the upload, verify the file's existence using `[ -f $FILENAME ]`.
    - Notify the user if the file is not found.

5. File Upload:
    - Use the cloud provider's CLI tools (e.g., `aws s3 cp`, `gsutil cp`, `az storage blob upload`) to upload the file.
    - Implement error handling to manage issues during the upload process.

6. Upload Feedback:
    - Provide a success message upon a successful upload.
    - Capture and display error messages if the upload fails.

7. Advanced Features (Optional but Recommended):

- Progress Bar/Percentage Completion: Use tools like `pv` to display upload progress.
- Shareable Link: Offer the option to generate and display a shareable link after the upload.
- File Synchronization: Implement a feature to handle cases where the file already exists in the cloud, offering options like overwrite, skip, or rename.
- Encryption: Integrate encryption for added security before the upload.

8.Documentation:

- Write a README.md file with setup instructions, usage examples, and troubleshooting tips.
- Include an overview, prerequisites, and common issues.

9.Distribution:

- Package the script for easy distribution.
- Provide installation instructions or a simple installation script.
- Include instructions to add the CLI tool to the user's $PATH for easy access.

### Skills and Commands

By completing this project, you should be proficient with various Linux commands and concepts, such as file manipulation, environment variables, process management, SSH, and package management.

### Outcome

You’ll have a functional, secure, and user-friendly CLI tool that uploads files to cloud storage, with proper error handling, optional advanced features, and thorough documentation. This project will enhance your understanding of cloud services, Bash scripting, and system administration.
