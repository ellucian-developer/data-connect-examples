# Encrypt Data Fitting Example: PGP Encryption Pipeline

This repository provides sample pipelines demonstrating how to use the **Encrypt Data** fitting in Data Connect to apply PGP encryption to sensitive data before transferring it to external systems.

**The Encrypt Data fitting enables secure, standards-compliant encryption of data within your pipelines.** It supports PGP (Pretty Good Privacy) encryption with optional digital signatures, making it ideal for protecting sensitive information during data transfers to external partners, government agencies, or third-party systems.

In this example, the pipeline extracts student worker records from Banner, formats the data as CSV, encrypts it using the Encrypt Data fitting with PGP, and uploads the encrypted file to an SFTP server.

---

## Encrypt Data Fitting Overview

The `encryptData` fitting provides PGP encryption capabilities with the following features:

### Key Features

| Feature | Description |
|---------|-------------|
| **PGP Encryption** | Encrypts data using a PGP public key, ensuring only the intended recipient can decrypt it |
| **Digital Signatures** | Optionally signs the encrypted data with a private key to verify authenticity and integrity |
| **Binary Output** | Produces binary encrypted output suitable for file transfer |
| **Error Handling** | Configurable error handling with the `ignoreErrors` option |

## Pipelines Included

* `encrypt-student-worker-data` – Extracts real student worker data from Banner, encrypts it using the Encrypt Data fitting, and uploads it to SFTP.
* `encrypt-student-worker-data-mock` – Uses mock data to demonstrate the Encrypt Data fitting without requiring a real connection.

---

## Prerequisites

You will need:

* Experience Premium with Integration Designer
* Insights with the Extensibility license (for the Extract Data fitting)
* **PGP key pair** for encryption and signing (public key, private key, and passphrase)
* SFTP server credentials (private key, username, host, and destination path)

## Pipeline Details

### `encrypt-student-worker-data`

This is the production pipeline that performs the following steps:

1. **Extract Data** – Queries Banner for active student worker records including employee details, position information, and salary data.
2. **Delimited Formatter** – Formats the extracted data into a CSV structure with selected columns.
3. **S3 Sink** – Stores the formatted CSV in S3 temporary storage.
4. **S3 Accessor** – Reads the CSV file from temporary storage for encryption.
5. **Encrypt Data** – **Encrypts the file using PGP encryption and signs it with a digital signature.**
6. **SFTP Put** – Securely uploads the encrypted GPG file to the configured SFTP server.

### `encrypt-student-worker-data-mock`

This is a test version of the pipeline that:

* Generates synthetic student worker data using a JavaScript Transform fitting
* Demonstrates the full Encrypt Data fitting workflow with mock data
* Is useful for testing encryption configuration without affecting real data

---

## Parameters

| Parameter | Description |
|-----------|-------------|
| `publicKeyEncrypt` | The PGP public key used to encrypt the data file |
| `privateKeyEncrypt` | The PGP private key used to sign the encrypted file for authenticity verification |
| `passphraseEncrypt` | The passphrase associated with the PGP private key used for signing |
| `privateKeySFTP` | The private key used for authenticating with the SFTP server |
| `sftpUsername` | The username for authenticating with the SFTP server |
| `sftpHost` | The hostname or IP address of the SFTP server |
| `sftpFilePath` | The full file path on the SFTP server where the encrypted file will be uploaded |

---

## Execution Instructions

### For the Mock Pipeline

1. Use the **Test** button in Integration Designer to simulate the entire workflow with mock data.
2. Provide valid PGP keys (public key, private key, and passphrase) to test the Encrypt Data fitting.
3. Provide SFTP credentials to complete the file upload.
4. Verify the encrypted `.gpg` file is successfully uploaded to the SFTP server.

### For the Production Pipeline

1. Ensure you have access to the Banner database with student worker data.
2. **Publish** the pipeline using Integration Designer.
3. Create a job in **Integration Packages** and provide values for all parameters.
4. Run the job to extract, encrypt, and upload the student worker data.

---

## Security Considerations

The Encrypt Data fitting provides multiple layers of security:

* **PGP Encryption**: Uses asymmetric encryption where data is encrypted with a public key and can only be decrypted with the corresponding private key held by the recipient.
* **Digital Signatures**: When `signature: true`, the fitting signs the data with your private key, allowing recipients to verify the data's authenticity and that it hasn't been tampered with.
* **Sensitive Parameters**: All encryption keys and credentials should be marked as `sensitive: true` in parameters to ensure they are stored securely and not logged.
* **Secure Transfer**: Combined with SFTP, provides end-to-end security for data in transit.

---

## Other Use Cases for Encrypt Data Fitting

The Encrypt Data fitting is essential for scenarios requiring secure data transfer:

* **Payroll exports** to external payroll providers
* **Financial data transfers** to auditing firms
* **HR data synchronization** with third-party HR systems
* **Student records exports** for verification services
* **Vendor data exchanges** requiring encryption compliance

---

## File Output

The pipeline generates a PGP-encrypted `.gpg` file containing the student worker data in CSV format. The file is uploaded to the specified SFTP location with the configured filename.
