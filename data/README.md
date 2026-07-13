# Project Data

This folder contains the source data used throughout the **Construction Operations Analytics** project.

## Data Workflow

The dataset was created from real construction site operational records collected during a road drainage construction project.

### Raw Data

The project includes two anonymized raw data sources:

* **raw_personal_records_anonymized** – Personal WhatsApp records containing project-related communications. Personal names, phone numbers, and other identifying information have been removed or anonymized.
* **raw_site_records_anonymized** – Daily construction site records documenting operational activities, material usage, progress updates, expenses, and project events. All sensitive information has been removed or anonymized.

### Data Cleaning

The cleaned dataset was created by:

* Extracting project-related information from the raw records
* Removing unrelated conversations
* Removing greetings and duplicate messages
* Removing personal names, phone numbers, and other identifying information
* Standardising dates
* Standardising activity names
* Correcting formatting inconsistencies
* Structuring the records into a tabular format

### Final Dataset

The cleaned operational records were transformed into a structured CSV dataset for analysis using **Excel, SQL, Python, Power BI, and Django**.

## Folder Structure

| Folder/File                           | Description                                                 |
| ------------------------------------- | ----------------------------------------------------------- |
| `raw/raw_personal_records_anonymized` | Anonymized personal project communication records           |
| `raw/raw_site_records_anonymized`     | Anonymized construction site operational records            |
| `cleaned/Cleaned_Operational_Log`     | Cleaned construction activity records prepared for analysis |
| `Operations_Master_Log.csv`           | Final structured dataset used for analysis                  |

## Privacy Notice

All personal information has been removed or anonymized before publication. This repository contains only data required for analytical, educational, and portfolio purposes.
