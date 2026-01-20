# Decrypt Data Fitting Example: PGP Decryption Pipeline

This repository provides sample pipelines demonstrating how to use the **Decrypt Data** fitting in Data Connect to apply PGP decryption to encrypted data received from external systems.

**The Decrypt Data fitting enables secure, standards-compliant decryption of data within your pipelines.** It supports PGP (Pretty Good Privacy) decryption with optional signature verification, making it ideal for processing encrypted information received from state and federal agencies, financial aid servicers, third-party systems, and other internal/external partners.

In this example, the pipeline retrieves an encrypted student worker file from an SFTP server, decrypts it using the Decrypt Data fitting with PGP, and uploads the decrypted file back to the SFTP server.

---

## Pipelines Included

* `decrypt-student-worker-data` – Retrieves encrypted student worker data from SFTP, decrypts it using the Decrypt Data fitting, and uploads the decrypted file to SFTP.

---

## Prerequisites

You will need:

* Experience Premium with Integration Designer
* **PGP key pair** for decryption and signature verification (private key, passphrase, and sender's public key for verification)
* SFTP server credentials (private key, username, host, and file paths)
* An encrypted file already uploaded to the SFTP server at the specified source path

## Pipeline Details

### `decrypt-student-worker-data`

This pipeline performs the following steps:

1. **SFTP Get** – Retrieves the encrypted student worker file from the SFTP server.
2. **Decrypt Data** – **Decrypts the file using PGP decryption and verifies the digital signature.**
3. **SFTP Put** – Securely uploads the decrypted file to the configured SFTP server.

---

## Parameters

| Parameter | Description |
|-----------|-------------|
| `privateKeyDecrypt` | The PGP private key used to decrypt the data file |
| `passphraseDecrypt` | The passphrase associated with the PGP private key used for decryption |
| `publicKeyVerify` | The PGP public key used to verify the digital signature for authenticity confirmation |
| `privateKeySFTP` | The private key used for authenticating with the SFTP server |
| `sftpUsername` | The username for authenticating with the SFTP server |
| `sftpHost` | The hostname or IP address of the SFTP server |
| `sftpSourceFilePath` | The full file path on the SFTP server where the encrypted file is located |
| `sftpDestinationFilePath` | The full file path on the SFTP server where the decrypted file will be uploaded |

---

## Execution Instructions

### For the Pipeline

1. **Publish** the pipeline using Integration Designer.
2. Create a job in **Integration Packages** and provide values for all parameters.
3. Run the job to retrieve, decrypt, and upload the student worker data.

---

## Other Use Cases for Decrypt Data Fitting

The Decrypt Data fitting is essential for scenarios requiring secure data reception in higher education:

* **National Student Clearinghouse** response files and verification results
* **State and federal reporting** response files and error reports
* **Financial aid data imports** from servicers, guarantors, and COD
* **Payroll imports** from external payroll providers
* **Student records transfers** from other institutions
* **HR and employee data synchronization** from third-party benefits providers

---

## Related Examples

See the companion **[Encrypt Data Fitting Example](../BETA-encrypt-student-worker-data/)** for a pipeline that demonstrates how to encrypt data using PGP before transferring it to external systems.
