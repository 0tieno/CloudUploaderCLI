# CloudUploaderCLI

## Objective

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
