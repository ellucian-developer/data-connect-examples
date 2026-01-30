# Execute Banner Job Fitting Example: OSHA Work-Related Injury Report

This repository provides a sample pipeline demonstrating how to use the **Execute Banner Job** fitting in Data Connect to run Banner batch jobs and capture their output for reporting and file generation.

**The Execute Banner Job fitting enables direct execution of Banner batch jobs from within your pipelines.** It supports passing parameters to the job, capturing output files, and integrating Banner's powerful reporting capabilities into your Data Connect workflows.

In this example, the pipeline executes the **PEROSHA** Banner job to generate OSHA Form 300 work-related injury and illness reports for a specific employer code and date range, then outputs the formatted report to a downloadable file.

---

## Use Case: OSHA Form 300 Compliance Reporting

The Occupational Safety and Health Administration (OSHA) requires employers to maintain records of work-related injuries and illnesses. The **PEROSHA** job in Banner Human Resources generates the data needed for OSHA Form 300 (Log of Work-Related Injuries and Illnesses).

This pipeline automates the generation of OSHA reports by:
- Extracting employee injury/illness data from Banner HR
- Filtering by employer code (e.g., "BU" for the main university)
- Specifying a reporting period (e.g., January 1 - December 31, 2024)
- Outputting a formatted report file for compliance review

### Report Contents

The PEROSHA job generates a report that includes:
- Employee identification information
- Date and location of injury/illness
- Description of the case
- Classification (injury type, illness category)
- Days away from work, job transfer, or restriction
- Case outcome information

---

## Pipeline Included

* `execute-banner-job-osha-report` – Executes the PEROSHA Banner job with configurable parameters and outputs the report to a downloadable file.

---

## Prerequisites

You will need:

* Experience Premium with Integration Designer
* Banner Human Resources module with PEROSHA job configured
* Ethos API key with appropriate permissions to execute Banner jobs
* Employee injury/illness data recorded in Banner HR

## Pipeline Details

### `execute-banner-job-osha-report`

This pipeline performs the following steps:

1. **Execute Banner Job** – **Runs the PEROSHA Banner job** with the specified date range and employer code parameters to generate OSHA work-related injury data.
2. **JavaScript Transform** – Formats the job output by joining the report array into a single text string.
3. **File Writer** – Saves the formatted report to a downloadable text file with a pre-signed URL for easy access.

---

## Parameters

| Parameter | Description |
|-----------|-------------|
| `ethosApiKey` | The Ethos API key used to authenticate with Banner for job execution |
| `startDate` | The start date for the OSHA report period (format: DD-MMM-YYYY, e.g., 01-JAN-2024) |
| `stopDate` | The stop date for the OSHA report period (format: DD-MMM-YYYY, e.g., 31-DEC-2024) |
| `employerCode` | The employer code to filter employee records (e.g., BU for main university) |

### PEROSHA Job Parameters

The Execute Banner Job fitting passes the following parameters to the PEROSHA job:

| Parameter # | Name | Type | Description |
|-------------|------|------|-------------|
| 01 | Start Date | date | Beginning of the reporting period |
| 02 | Stop Date | date | End of the reporting period |
| 03 | Industrial Description | character | Optional filter by industry description |
| 04 | SIC Code | number | Optional Standard Industrial Classification code filter |
| 05 | Employer Code | character | Required employer code filter (e.g., BU) |
| 06 | Exclude Employee Class | character | Optional employee class exclusion filter |
| 07 | Create 300A electronic file | character | Whether to create the 300A summary file (Y/N) |

---

## Execution Instructions

### Running the Pipeline

1. **Publish** the pipeline using Integration Designer.
2. Create a job in **Integration Packages** and provide values for all parameters:
   - Enter your Ethos API key
   - Set the start date (e.g., `01-JAN-2024`)
   - Set the stop date (e.g., `31-DEC-2024`)
   - Specify the employer code (e.g., `BU`)
3. Run the job to execute the PEROSHA report and generate the output file.

### Testing the Pipeline

1. Use the **Test** button in Integration Designer to run the pipeline.
2. Provide valid Ethos API credentials and parameters.
3. Verify the report output contains the expected OSHA injury/illness data.
4. Download the report from the generated pre-signed URL in the test results.

---

## Other Use Cases for Execute Banner Job Fitting

The Execute Banner Job fitting can be used to automate other Banner batch processes. The following jobs have been tested and verified:

| Banner Job | Description |
|------------|-------------|
| **PHPDIRD** | HR Directory report with pagination support |
| **SCRBULT** | Academic courses report for an academic year |
| **SGRSTDN** | Student records using population selection |
| **GURPDED** | Data element dictionary report |
| **GJRRPTS** | General reports |

Any Banner batch job that can be executed through Job Submission can be automated using the Execute Banner Job fitting.

---

## Possible Enhancements

This pipeline can be extended with additional fittings to enhance the output and delivery:

* **Create PDF** – Use the Create PDF fitting to convert the OSHA report into a professionally formatted PDF document suitable for official recordkeeping and submission.
* **Send Notification** – Use the Send Notification fitting to automatically email the generated report to HR administrators, safety officers, or compliance teams upon completion.
* **SFTP Put** – Upload the report directly to an SFTP server for integration with other compliance systems.
* **Encrypt Data** – Encrypt the report using PGP before transmission if sending to external agencies or partners.
