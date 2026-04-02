🏠 **Airbnb Data Engineering Pipeline**

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=sqlite&logoColor=white)




Modern Data Stack: Snowflake | dbt | AWS

📋 Project Overview

This project demonstrates a complete end-to-end data engineering pipeline. I transformed raw Airbnb data into an analytics-ready "One Big Table" (OBT) using a Medallion Architecture (Bronze → Silver → Gold).

The goal was to move away from messy, hardcoded SQL toward a modular, scalable dbt project that supports business intelligence and historical data tracking.

🏗️ The Architecture

The pipeline follows a structured flow to ensure data quality at every step:

Extraction: Raw CSVs (Bookings, Listings, Hosts) stored in AWS S3.

Loading: Data ingested into Snowflake staging tables.

Transformation (dbt):

Bronze: Raw schema mirroring source data.

Silver: Cleaned data, handled data types, and applied business logic (e.g., price tagging).

Gold: Denormalized OBT (One Big Table) for high-performance reporting.

Storage: Fully hosted on Snowflake Cloud Data Warehouse.

🛠️ Tech Stack

Warehouse: Snowflake

Transformation: dbt (Data Build Tool)

Language: SQL & Jinja (for dynamic modeling)

Cloud: AWS (S3 Storage)

Environment: Python 3.12 & VS Code

🚀 Key Technical Features

1. Metadata-Driven OBT

Instead of writing massive, repetitive JOIN statements, I implemented a Jinja-based configuration. This allows the project to stay "DRY" (Don't Repeat Yourself) and makes adding new columns as simple as updating a list.

2. Automated Data Lineage

By utilizing the ref() function throughout the project, I enabled dbt's powerful Lineage Graph. This ensures that:

Upstream dependencies are always respected.

Recruiters/Collaborators can visually trace data from raw source to final analytics.

3. SCD Type 2 (Snapshots)

I implemented Slowly Changing Dimensions to track changes in Airbnb listings and host profiles over time, ensuring no historical data is lost when a price or status changes.

4. Data Quality Testing

Included automated schema tests to ensure:

Uniqueness: No duplicate booking IDs.

Integrity: Every booking links to a valid listing.

Custom Logic: Specific tests to catch data anomalies in source files.



1. **[Custom Pricing Tag Macro](./aws_dbt_snowflake_project/macros/tag.sql)** Implements business logic to categorize listings into 'Low', 'Medium', and 'High' price buckets.

2. **[Metadata-Driven OBT](./aws_dbt_snowflake_project/models/gold/obt.sql)** Uses Jinja loops and configuration lists to dynamically join Silver layers into a denormalized analytics table.

3. **[SCD Type 2 Snapshots](./aws_dbt_snowflake_project/snapshots/)** Tracks historical changes for `hosts` `bookings` and `listings` using dbt snapshots to maintain data integrity over time.


📈 How to Run This Project

Clone the repo: git clone <https://github.com/bilalrizvi21/aws-snowflake-dbt-airbnb>

Setup Profile: Configure your profiles.yml with your Snowflake credentials.

Install dbt dependencies: dbt deps

Build the Pipeline: dbt build (This runs all models, tests, and snapshots in the correct order).
