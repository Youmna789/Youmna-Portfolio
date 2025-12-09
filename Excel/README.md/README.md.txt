Apple Sales & Warranty Analysis – Excel Dashboard
-Project Overview

This project analyzes Apple sales data and warranty claim data using Excel.
Two datasets were cleaned and connected together using a data model relationship, which allows the creation of interactive Pivot Tables and visual dashboards showing claim rates, sales performance, and store-level insights.

The final output is a fully interactive Excel dashboard that helps identify:

Top-selling Apple products

Claim/repair performance

Claim rates per product

Performance across countries

Top 5 stores by sales

Category-level claim distribution


-Dashboard Contents

The final Excel dashboard contains the following visual insights:

1️) Claim Status by Product

Comparison between Completed vs Rejected claims

Bar charts showing claim volume for each Apple product

Helps identify which products have the highest failure rates

2️) Country Claim Distribution

Pie chart showing % share of claims from:

Australia

China

Japan

United States

3️)Claim Rate per Product

Claim rate calculated as:
(Total Claims / Total Sales) × 100  (calculated measure)

Shows which products perform best in terms of reliability

Visual comparison using a column chart

4️) Claims by Product Category

Categories include:

Smartphone

Accessories

Desktop

Laptop

Wearable

Audio

Tablet

Subscription Services

Provides a clear breakdown and a horizontal bar chart.

5️) Top 5 Stores

Shows the stores with the highest number of sold units:

Apple Chadstone

Apple Covent Garden

Apple The Dubai Mall

Apple Central World

Apple Orchard Road

6️) Total Sales by Product

Final visualization summarizing overall sales distribution across selected Apple products.

- Data Model

A relationship was created between the tables to enable advanced analysis.

Relationship Used

sales table (Product_Name, Store_Name,… )

warranty table (Product_Name, Claim_ID, Repair_Status,…)

Primary Key: Sale_ID
Relationship: One-to-many
This allows PivotTables to blend warranty and sales insights together.

- Tools Used

Microsoft Excel

Pivot Tables

Pivot Charts

Data Model (Power Pivot)

Slicers for interactivity

Data Cleaning & Formatting

Dashboard Design

- Key Insights

Claim rates across Apple products are very close (around 0.56% on average).

Top-selling products include Apple Watch Series 7, Apple Watch Series 9, and HomePod mini.

USA accounts for the largest share of warranty claims.

Accessories and smartphones have the highest claim volume.