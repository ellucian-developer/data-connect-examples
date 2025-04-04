# Data Connect Pipelines for Insights - Ellucian Live 2025 Hurricane Example

This repository contains a set of sample pipelines to demonstrate the use of Data Connect with Insights.

In this demonstration, you will import a list of hurricanes from HURDAT2, and join this data with data from Ellucian Student powered by Banner.  This includes a custom function to determine which hurricane landfall points were near Orlando, FL.  The list of hurricanes will be joined to a list of students who were enrolled in the same years as the storms.

The following Data Connect integration pipelines are included:

* `elive-2025-import-hurdat2` - parses a flat file of hurricane storm information and imports it into Insights
* `elive-2025-hurricane-students` - creates a `hurricane_students` table, a custom function for calculating hurricane proximity, and a custom transform to join the hurricane data with student data
* `elive-2025-hurricane-report` - creates an HTML file by extracting the hurricane student list from Insights

## Prerequisites

You must have the following:

* Experience Premium with the Integration Designer
* Insights with the Extensibility license to do custom transformations

## Importing the Pipelines

For each pipeline in this repository:

1. Create the same pipeline name in the Integration Designer, but with an institution prefix, e.g. myschool-elive-2025-hurricane-report.
2. Click on Pipeline Settings -> Import to overwrite the pipeline with the pipeline from this repository.

## Executing the Pipelines

For all of these *except the custom import*, you can use the Test button in the Integration Designer to create and/or run the database artifacts.

For the custom import, you must click the Publish button in the Integration Designer, and then switch to the Integration Packages card in Experience, and run the pipeline as a job.

You'll need to download the HURDAT2 flat file and upload it when you create and run the job for the import.
https://www.nhc.noaa.gov/data/
https://www.nhc.noaa.gov/data/hurdat/hurdat2-1851-2024-040425.txt

The job will take about 15 minutes to run.

You can use the Insights reporting tool in Experience to view the data that is created by this demonstration.

