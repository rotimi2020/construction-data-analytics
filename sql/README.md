# SQL Scripts

This folder contains the SQL Server scripts used for data validation, cleaning, and business analysis for the **Construction Operations Analytics** project.

The scripts handle everything from setting up the database structure to importing the dataset and running key analytical queries for cost breakdowns, productivity tracking, and cement reconciliation.

---

## Files

| File | Description |
|------|-------------|
| `create_tables.sql` | Creates the `operations_master_log` table structure. |
| `import_data.sql` | Imports the cleaned CSV dataset into the table. |
| `data_validation.sql` | Validates data types, null values, and duplicate records. |
| `data_cleaning.sql` | Cleans and standardises the dataset for analysis. |
| `analysis_queries.sql` | Business analysis queries for KPIs, cost analysis, and cement reconciliation. |

---

## Recommended Run Order

For a clean workflow, run the scripts in the following order:

1. `create_tables.sql` – Creates the database table.
2. `import_data.sql` – Imports the cleaned dataset.
3. `data_validation.sql` – Checks for data quality issues.
4. `data_cleaning.sql` – Cleans and standardises the data.
5. `analysis_queries.sql` – Runs the business analysis queries.

---

## Screenshots (`/screenshots/`)

| File | Description |
|------|-------------|
| `master_log_table.png` | Database table design showing columns, data types, and the primary key. |
| `cement_reconciliation_sql.png` | SQL query demonstrating cement reconciliation using `CASE WHEN`. |

---

## What This Shows

These scripts demonstrate my ability to:

- Design a relational database for operational data
- Import and validate CSV datasets
- Clean and standardise records using SQL
- Write business-focused analytical queries
- Use conditional logic (`CASE WHEN`) for cement reconciliation and cost analysis
- Support data-driven reporting for construction operations

---

## Author

**Rotimi S. Omosewo**

- LinkedIn: [linkedin.com/in/rotimi-sheriff-omosewo](https://linkedin.com/in/rotimi-sheriff-omosewo)
- GitHub: [github.com/rotimi2020](https://github.com/rotimi2020/)
- Portfolio: [rotimi2020.github.io](https://rotimi2020.github.io/)