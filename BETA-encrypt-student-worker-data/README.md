# Encrypt Data Fitting Example: PGP Encryption Pipeline

This repository provides sample pipelines demonstrating how to use the **Encrypt Data** fitting in Data Connect to apply PGP encryption to sensitive data before transferring it to external systems.

**The Encrypt Data fitting enables secure, standards-compliant encryption of data within your pipelines.** It supports PGP (Pretty Good Privacy) encryption with optional digital signatures, making it ideal for protecting sensitive information during data transfers to state and federal reporting agencies, financial aid servicers, third-party systems, and other internal/external partners.

In this example, the pipeline extracts student worker records from Banner, formats the data as CSV, encrypts it using the Encrypt Data fitting with PGP, and uploads the encrypted file to an SFTP server.

---

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
3. **File Writer** – Stores the formatted CSV in S3 temporary storage.
4. **File Reader** – Reads the CSV file from temporary storage for encryption.
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

## Other Use Cases for Encrypt Data Fitting

The Encrypt Data fitting is essential for scenarios requiring secure data transfer in higher education:

* **National Student Clearinghouse** enrollment and degree verification submissions
* **State and federal reporting** (IPEDS, state longitudinal data systems)
* **Financial aid data exports** to servicers and guarantors
* **Payroll exports** to external payroll providers
* **Student records transfers** to other institutions or verification services
* **HR and employee data synchronization** with third-party benefits providers

---

## Related Examples

See the companion **[Decrypt Data Fitting Example](../BETA-decrypt-student-worker-data/)** for a pipeline that demonstrates how to decrypt PGP-encrypted data received from external systems.
