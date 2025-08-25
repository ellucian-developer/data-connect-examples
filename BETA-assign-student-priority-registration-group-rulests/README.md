# Automated Student Priority Registration Group Assignment using Rules Engine

This repository provides a sample pipeline demonstrating how to use Data Connect's **Run Ruleset fitting** on the **Ellucian SaaS platform through Experience** to automate the assignment of priority registration groups for students based on configurable business rules. The example showcases how sophisticated decision-making workflows and seamless integrations can be triggered by Banner events.

**The Run Ruleset fitting is the centerpiece of this automation,** allowing you to define complex, multi-criteria business logic without custom code. This empowers institutions to automate complex decision-making processes that would otherwise require manual review and intervention through powerful integration and automation capabilities.

In this scenario, a business event is triggered when a student's full-time status is changed in Banner. The pipeline consumes this event, gathers relevant student information, and uses the **Run Ruleset fitting** to evaluate the data against predefined rules and assign the student to the appropriate priority registration group for the upcoming term.

> **Note:** You must have the business event configured in Banner Event Publisher (BEP), a subscriber application set up in Ethos Integration, and access to the Rules Engine in Integration Packages to create and publish rulesets for use with the Run Ruleset fitting.

---

## Pipelines Included

* `assign-student-priority-registration-group-rulesets` – Demonstrates the Run Ruleset fitting by consuming full-time status change events, evaluating student data through configurable business rules, and generating a CSV report with priority assignments.

---

## Prerequisites

You will need:

* Experience Premium with Integration Designer
* Integration Packages with Rules Engine access to create and publish rulesets
* Banner system access with Banner Event Publisher (BEP)
* Ethos Integration subscriber application
* Access to academic standing codes, sport codes, and student classification data

**Key Component**: The Run Ruleset fitting requires a published ruleset from Integration Packages to function.

---

## The Run Ruleset Fitting in Action

The pipeline evaluates students against the following priority registration group criteria using the Run Ruleset fitting:

| Priority Group | Criteria 1 | OR Criteria 2 |
|---|---|---|
| 1 | Full time senior (04) on Dean's list with first class honors (astd 11) | Full time and part time athletes |
| 2 | Full time seniors | Full time and part time veterans |
| 3 | Full time juniors (3rd year) | Part time seniors |
| 4 | Full time sophomores (2nd year) | Part time juniors |
| 5 | Full time freshmen | Part time sophomores |
| 6 | Part time freshmen | |

---

## Pipeline Details

### `assign-student-priority-registration-group-rulesets`

This pipeline performs the following steps:

1. **Data Preparation**: Retrieves academic standing codes and sport activity codes for reference
2. **Event Consumption**: Consumes the student full-time status change business event
3. **Student Data Gathering**: Retrieves student GUID and classification information
4. **Data Transformation**: Filters and prepares student data for rules evaluation
5. **Rules Evaluation with Run Ruleset Fitting**: Executes the published ruleset against student data to determine priority group assignments
6. **Report Generation**: Formats results and generates a CSV report with priority assignments
7. **Event Confirmation**: Confirms the business event processing

**The Run Ruleset Fitting Configuration:**
- **Fitting Type**: Run Ruleset - the core component that enables rule-based decision making
- **Ruleset Reference**: `FTchangeEvaluateStudentRegistrationGroup` (published from Integration Packages)
- **Data Mapping**: Maps incoming student data to ruleset input elements for evaluation
- **Output Processing**: Captures ruleset decisions and formats them for downstream processing

**How the Run Ruleset Fitting Works:**
1. Receives formatted student data from upstream pipeline steps
2. Maps data elements to the published ruleset's input criteria
3. Executes the business rules against the student's specific attributes
4. Returns priority group assignments based on rule evaluation results
5. Passes results to subsequent pipeline steps for report generation

**Ruleset Business Logic:**
- Evaluates multiple student attributes: classification, academic standing, sport participation, veteran status, and enrollment status
- Applies complex OR/AND logic across multiple criteria
- Maps student data to appropriate priority registration groups based on configurable business rules

---

## Execution Instructions

1. **Configure the Business Event in BEP:**  
   Set up a business event in Banner Event Publisher to listen for changes to the full-time indicator field (`SGBSTDN_FULL_PART_IND`) in the `SGBSTDN` table.
   
   **Additional Data Configuration:**
   - **GORGUID**: Include `GORGUID_GUID` to retrieve student person ID
   - **SGRSPRT**: Include `SGRSPRT_ACTC_CODE` for sport codes
   - **SHRTTRM**: Include `SHRTTRM_ASTD_CODE_DL` and `SHRTTRM_ASTD_CODE_END_OF_TERM` for academic standing
   - **SPBPERS**: Include `SPBPERS_VERA_IND` for veteran status
   - **SPRIDEN**: Include `SPRIDEN_FIRST_NAME` and `SPRIDEN_LAST_NAME` for student names

2. **Create and Publish the Ruleset:**  
   In Integration Packages, create the `FTchangeEvaluateStudentRegistrationGroup` ruleset with rules that match the priority assignment logic outlined above. **This published ruleset is essential for the Run Ruleset fitting to function.**

3. **Subscribe to the Event:**  
   Set up a subscriber application in Ethos Integration and subscribe to the `student-fulltimestatus-changed` business event.

4. **Configure the Run Ruleset Fitting:**  
   In Integration Designer, add the Run Ruleset fitting to your pipeline and configure it to:
   - Reference the published `FTchangeEvaluateStudentRegistrationGroup` ruleset
   - Map incoming student data fields to the ruleset's input elements
   - Process ruleset outputs for downstream consumption

5. **Publish the Pipeline:**  
   Publish the complete pipeline in Integration Designer. The pipeline requires an Ethos API key parameter for accessing student data.

5. **Configure the Job:**  
   In Integration Packages, create a new job for the pipeline and configure it to be triggered by the business event.

Once configured, whenever a student's full-time status is changed in Banner, the business event will trigger and the pipeline will automatically use the Run Ruleset fitting to evaluate the student's data and assign them to the appropriate priority registration group based on your published business rules.

---

## Pipeline Outputs

The pipeline generates a CSV report (`StudentPriorityAssignmentReport.csv`) containing:
- Student identification information
- Academic standing details
- Sport participation status
- Veteran status
- Assigned priority registration group

---

## Other Use Cases

This Run Ruleset fitting pattern is particularly useful in higher education for automating student services workflows, such as:

- **Academic Probation Management** – Automatically categorize students based on academic performance metrics
- **Financial Aid Prioritization** – Assign students to aid processing queues based on need and status
- **Advising Appointment Scheduling** – Prioritize appointment slots based on student classification and risk factors
- **Graduation Clearance Processing** – Route students through different clearance workflows based on completion status
- **Housing Assignment Priorities** – Determine housing selection order based on student characteristics

---

## Conclusion

This example demonstrates how the **Run Ruleset fitting** enables sophisticated, rule-based automation in Banner environments. The platform's integration capabilities allow institutions to seamlessly combine event processing with configurable business logic execution, creating powerful automation that scales to handle thousands of students while maintaining consistency in policy application.
