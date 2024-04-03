# Data Connect Pipelines for Insights

This repository contains a set of sample pipelines to demonstrate the use of Data Connect with Insights.

In this demonstration, you will import a list of Star Trek episodes from a CSV file, and assign a random star trek episode to each student who is a computer science major. Then you will produce an HTML report with the assignment list.

The following Data Connect integration pipelines are included:

* `star-trek-custom-table` - creates the `student_episodes` table to store the final assignments
* `star-trek-custom-import` - imports the CSV data from `star_trek_original_series_epsiodes.csv` into the `star_trek_episodes` table in Insights
* `star-trek-custom-function` - creates a `random_star_trek_episode` custom function in Insights
* `star-trek-custom-transformation` - creates the ETL sequence to populate `student_episodes` with data using the custom function
* `star-trek-custom-extract` - creates an HTML file with the list of assignments extracted from the `student_episodes` table in Insights

Other files included for reference and easy reading:

* `custom-function.sql` - the function code
* `intermediate.sql` - the code for the Intermediate SQL step on the custom transformation
* `target.sql` - the code for the Target SQL step on the custom transformation
* `report.html` - the HTML code for the final report

## Prerequisites

You must have the following:

* Experience Premium with the Integration Designer
* Insights with the Extensibility license to do custom transformations

## Importing the Pipelines

For each pipeline in this repository:

1. Create the same pipeline name in the Integration Designer, but with an institution prefix, e.g. myschool-star-trek-custom-table.
2. Click on Pipeline Settings -> Import to overwrite the pipeline with the pipeline from this repository.

## Executing the Pipelines

For all of these *except the custom import*, you can use the Test button in the Integration Designer to create and/or run the database artifacts.

For the custom import, you must click the Publish button in the Integration Designer, and then switch to the Integration Packages card in Experience, and run the pipeline as a job.  When you create the job, select the `star_trek_original_series_episodes.csv` file for upload.  The job will take about 15 minutes to run.

You can use the Insights reporting tool in Experience to view the data that is created by this demonstration.

