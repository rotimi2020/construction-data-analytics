# Power BI DAX Measures — Construction Operations Analytics

This document contains the DAX measures developed for the Construction Operations Analytics Dashboard. These measures support project cost analysis, operational reporting, productivity tracking, equipment utilisation, cement reconciliation, and time-based analysis using data from a real road drainage construction project.

---

# 1. Date Intelligence

## Custom Date Table

Creates a calendar table to support time intelligence, filtering, and trend analysis.

```dax
DateTable =
ADDCOLUMNS (
    CALENDAR ( MIN ( Site_Log[Date] ), MAX ( Site_Log[Date] ) ),
    "Year", YEAR ( [Date] ),
    "MonthNumber", MONTH ( [Date] ),
    "MonthName", FORMAT ( [Date], "MMM-YY" ),
    "MonthSort", YEAR ( [Date] ) * 100 + MONTH ( [Date] ),
    "WeekNumISO", WEEKNUM ( [Date], 2 ),
    "DayName", FORMAT ( [Date], "dddd" )
)
```

---

# 2. Cost Measures

## Total Labour Cost

Calculates total labour expenditure.

```dax
Total Labour Cost =
SUM ( Site_Log[Labour_Cost_NGN] )
```

## Total Project Cost

Calculates the total construction project cost.

```dax
Total Project Cost =
    SUM ( Site_Log[Labour_Cost_NGN] )
    + SUM ( Site_Log[Excavation_Cost_NGN] )
    + SUM ( Site_Log[Base_Casting_Cost_NGN] )
    + SUM ( Site_Log[Wall_Casting_Cost_NGN] )
    + SUM ( Site_Log[Water_Trip_Cost_NGN] )
```

## Running Total Cost

Calculates the cumulative project cost over time.

```dax
Running Total Cost =
CALCULATE (
    [Total Project Cost],
    FILTER (
        ALLSELECTED ( DateTable[Date] ),
        DateTable[Date] <= MAX ( DateTable[Date] )
    )
)
```

---

# 3. Operational Measures

## Active Work Days

Counts the number of productive workdays.

```dax
Active Work Days =
CALCULATE (
    DISTINCTCOUNT ( Site_Log[Date] ),
    Site_Log[Quantity] > 0
)
```

## Total Excavation Volume (m)

Calculates total excavation and excavation repair completed.

```dax
Total Excavation Volume (m) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] IN { "Excavation", "Excavation Repair" }
)
```

## Total Base Casting Volume (m)

Calculates total base casting completed.

```dax
Total Base Casting Volume (m) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Base Casting"
)
```

## Total Wall Casting Volume (m)

Calculates total wall casting completed.

```dax
Total Wall Casting Volume (m) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Wall Casting"
)
```

## Total Concrete Cast (m)

Calculates total concrete casting completed.

```dax
Total Concrete Cast (m) =
    [Total Base Casting Volume (m)]
    + [Total Wall Casting Volume (m)]
```

---

# 4. Equipment Measures

## Total Mixer Hours

Calculates total concrete mixer operating hours.

```dax
Total Mixer Hours =
SUM ( Site_Log[Mixer_Hours] )
```

## Total Vibrator Hours

Calculates total concrete vibrator operating hours.

```dax
Total Vibrator Hours =
SUM ( Site_Log[Vibrator_Hours] )
```

## Total Equipment Hours

Calculates total combined equipment operating hours.

```dax
Total Equipment Hours =
    [Total Mixer Hours]
    + [Total Vibrator Hours]
```

---

# 5. Cement Management Measures

## Cement Delivered (bags)

Calculates total cement delivered to the project.

```dax
Cement Delivered (bags) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Cement Delivered"
)
```

## Cement Used (bags)

Calculates total cement consumed in construction activities.

```dax
Cement Used (bags) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Cement Used"
)
```

## Cement Missing (bags)

Calculates total cement bags reported as missing.

```dax
Cement Missing (bags) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Cement Missing"
)
```

## Cement Spillage (bags)

Calculates total cement bags lost due to spillage.

```dax
Cement Spillage (bags) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Cement Spillage"
)
```

## Cement Remaining Reported (bags)

Calculates the reported cement balance remaining on site.

```dax
Cement Remaining Reported (bags) =
CALCULATE (
    SUM ( Site_Log[Quantity] ),
    Site_Log[Item] = "Cement Remaining"
)
```

## Cement Loss Total (bags)

Calculates total cement loss due to missing bags and spillage.

```dax
Cement Loss Total (bags) =
    [Cement Missing (bags)]
    + [Cement Spillage (bags)]
```

## Cement Balance Check (bags)

Verifies full cement reconciliation. A result of zero confirms complete accountability.

```dax
Cement Balance Check (bags) =
    [Cement Delivered (bags)]
    - [Cement Used (bags)]
    - [Cement Loss Total (bags)]
    - [Cement Remaining Reported (bags)]
```

## Percentage Cement Loss

Calculates the percentage of delivered cement lost during project execution.

```dax
% Cement Loss =
DIVIDE (
    [Cement Loss Total (bags)],
    [Cement Delivered (bags)],
    0
)
```

---

## Project Summary

- **Platform:** Microsoft Power BI
- **Dataset:** Construction Operations Master Log
- **Project Type:** Road Drainage Construction Analytics
- **Data Source:** Daily site operational records
- **Key Focus Areas:** Cost Analysis, Productivity, Equipment Utilisation, Cement Reconciliation, and Time Intelligence
