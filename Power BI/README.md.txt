Project Overview

This Power BI project provides an end-to-end analysis of Apple’s Desktop and Laptop sales, along with insights related to store performance, product demand, geographic distribution .
The report was designed to highlight the overall performance trend, year-over-year changes, and sales differences between Desktop and Laptop categories.

The dashboard includes:

Interactive slicers (Year, Country)

Multiple visual pages

Growth KPIs

Product-level insights

Store-level performance

A full set of custom DAX measures

--Dashboard Pages
1. Desktop Dashboard Analysis

Key metrics:

Desktop Sales Total

Desktop Sales %

Desktop Sales Growth % (YoY)

Sales Difference (Laptop – Desktop)

Visuals included:

Desktop Sales by Product Name

Desktop Sales by Country (Map)

Desktop Sales by Year

Desktop vs Laptop Sales % (Pie Chart)

2. Laptop Dashboard Analysis

Key metrics:

Laptop Sales Total

Laptop Sales %

Laptop Sales Growth % (YoY)

Sales Difference (Laptop – Desktop)

Visuals included:

Laptop Sales by Store Name

Laptop Sales by Product Name

Laptop Sales by Year

Laptop Sales by Country

Laptop Sales by City (Donut Chart)

3. Combined Sales Analysis

A comparison view showing:

Desktop vs Laptop market distribution

Product-level demand comparison

Country and city performance


--Key Business Insights

Laptops represent the higher market share, reaching ~58%.

Desktops reached ~41% of total sales.

Both categories show slight YoY decline in 2024.

Certain products—such as iMac 27-inch and MacBook Air (Retina/M1)—dominate their categories.

Strongest markets include the United States, China, Australia, Japan, and Canada.


-- Some of DAX Measures Used :

This project uses multiple DAX calculations, such as:

-Sales

Sales = sales[Unit_Price] * sales[Quantity]

-Desktop Sales

Desktop Sales = 
CALCULATE(
    [Total Sales Amount],
    Sales[Category_Name] = "Desktop"
)


-Desktop Sales %

Desktop Sales % = DIVIDE([Desktop Sales],[Laptop Sales]+[Desktop Sales])

-Desktop Sales Growth 

Desktop Sales Growth % = 
VAR CurrentYearSales = [Desktop Sales]
VAR PreviousYearSales = CALCULATE(
   [Desktop Sales],
    DATEADD('sales'[Sale_Date], -1, YEAR)
)
RETURN
DIVIDE(CurrentYearSales - PreviousYearSales, PreviousYearSales)

- Sales Difference 

Sales Difference (Laptop - Desktop) = 
[Laptop Sales] - [Desktop Sales]

-Total Sales Amount 

Total Sales Amount = SUMX(Sales, Sales[Quantity] * Sales[Unit_Price])
