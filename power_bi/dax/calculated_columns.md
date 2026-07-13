# Power BI Calculated Columns — Construction Operations Analytics

This document contains the calculated columns developed for the Construction Operations Analytics Dashboard. These columns support operational classification, cost categorisation, total cost aggregation, and rate validation using data from a real road drainage construction project.

---

# 1. Material Loss Flag

## Material Loss Flag

Classifies each site record as a loss or shortage event based on the operation type. Used to filter and highlight material loss records in reports and visuals.

```dax
Material_Loss_Flag =
IF (
    Site_Log[Operation] = "Missing"
        || Site_Log[Operation] = "Spilled",
    "Loss / Shortage",
    "Normal"
)
```

---

# 2. Cost Classification

## Cost Category

Assigns each record to a cost category based on which cost column contains a value. Used to group and filter records by activity type in dashboards and reports.

```dax
Cost_Category =
SWITCH (
    TRUE (),
    Site_Log[Labour_Cost_NGN] > 0,         "Labour",
    Site_Log[Excavation_Cost_NGN] > 0,     "Excavation",
    Site_Log[Base_Casting_Cost_NGN] > 0,   "Base Casting",
    Site_Log[Wall_Casting_Cost_NGN] > 0,   "Wall Casting",
    Site_Log[Water_Trip_Cost_NGN] > 0,     "Water Supply",
    "Non-Cost Activity"
)
```

---

# 3. Total Cost

## Total Cost (NGN)

Calculates the total cost for each individual site record by summing all cost columns across labour, excavation, base casting, wall casting, and water supply.

```dax
Total_Cost_NGN =
    Site_Log[Labour_Cost_NGN]
    + Site_Log[Excavation_Cost_NGN]
    + Site_Log[Base_Casting_Cost_NGN]
    + Site_Log[Wall_Casting_Cost_NGN]
    + Site_Log[Water_Trip_Cost_NGN]
```

---

# 4. Rate Validation

## Excavation Rate Check

Calculates the cost per unit of excavation for each record where both quantity and excavation cost are present. Returns BLANK where no excavation activity was recorded. Used to validate excavation pricing consistency across site records.

```dax
Excavation_Rate_Check =
IF (
    Site_Log[Quantity] > 0
        && Site_Log[Excavation_Cost_NGN] > 0,
    DIVIDE (
        Site_Log[Excavation_Cost_NGN],
        Site_Log[Quantity]
    ),
    BLANK ()
)
```

---

## Project Summary

- **Platform:** Microsoft Power BI
- **Dataset:** Construction Operations Master Log
- **Project Type:** Road Drainage Construction Analytics
- **Data Source:** Daily site operational records
- **Key Focus Areas:** Material Loss Tracking, Cost Classification, Row-Level Cost Aggregation, and Rate Validation