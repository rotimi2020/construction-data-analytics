# Python Analytics

This folder contains the Python code that powers the data processing and reporting for the **Construction Operations Analytics** project.

It takes raw construction site records, cleans and validates the data, performs the analysis, generates charts, and exports the results into CSV files and a formatted Excel summary.

---

## Files

| File | Description |
|------|-------------|
| `construction_analytics.ipynb` | Jupyter Notebook – step-by-step analysis with visual outputs. |
| `construction_analytics.py` | Python script – runs the full analysis pipeline in one go. |
| `requirements.txt` | List of Python packages required to run the project. |
| `outputs/` | Generated charts, CSV exports, and Excel reports. |

---

## Generated Outputs (`/outputs/`)

The script automatically creates the following folders and files.

### 📊 Charts (`/charts/`)

| File | What it shows |
|------|---------------|
| `cost_by_location.png` | Total cost breakdown by site location. |
| `equipment_by_location.png` | Mixer and vibrator hours by site. |
| `monthly_cost_trend.png` | Project cost trend by month. |
| `weekly_productivity.png` | Weekly construction productivity trend. |

### 📈 CSV Exports (`/csv/`)

| File | What it contains |
|------|------------------|
| `cement_by_location.csv` | Cement usage breakdown by site. |
| `cement_reconciliation.csv` | Cement delivered, used, missing, and remaining. |
| `cost_by_location.csv` | Cost breakdown by location. |
| `equipment_utilisation.csv` | Equipment hours by site. |
| `material_consumption.csv` | Material usage summary. |
| `monthly_cost_trend.csv` | Monthly project cost data. |
| `top_cost_activities.csv` | Highest-cost construction activities. |
| `weekly_productivity.csv` | Weekly productivity data. |

### 📄 Reports (`/reports/`)

| File | What it contains |
|------|------------------|
| `project_summary_report.xlsx` | Formatted Excel summary containing project KPIs and metrics with bold headers, right-aligned numbers, and auto-adjusted columns. |

---

## What It Does

- Checks data quality (missing values, duplicates, and negative quantities)
- Cleans and standardises dates, numbers, and units
- Adds useful columns such as total cost, equipment hours, and month groupings
- Generates KPI summaries (duration, locations, activity types, and total cost)
- Creates charts for cost by location, weekly productivity, equipment usage, and monthly trends
- Tracks materials, equipment hours, and cement reconciliation
- Flags excavation rates that fall outside expected ranges
- Exports results to CSV files, PNG charts, and a formatted Excel summary

---

## Tech Stack

- **Pandas** – Data cleaning and analysis
- **Matplotlib** – Chart generation
- **OpenPyXL** – Excel report generation and formatting

---

## How to Run

1. Place `Operations_Master_Log.csv` in the same folder as the script.

2. Install the required packages:

```bash
pip install -r requirements.txt
```

3. Run the Python script:

```bash
python construction_analytics.py
```

Or open the Jupyter Notebook:

```bash
jupyter notebook construction_analytics.ipynb
```

4. Check the `outputs/` folder for the generated charts, CSV files, and Excel report.

---

## What This Shows

This project demonstrates the ability to transform raw construction site data into clean, structured, and actionable information. It showcases practical Python skills for data cleaning, analysis, visualisation, automation, and report generation using real construction operational data.

---

## Author

**Rotimi S. Omosewo**

- **LinkedIn:** https://linkedin.com/in/rotimi-sheriff-omosewo
- **GitHub:** https://github.com/rotimi2020
- **Portfolio:** https://rotimi2020.github.io