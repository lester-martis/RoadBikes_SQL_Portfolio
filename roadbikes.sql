
/*  
	RoadBikes is a Bicycle and its accessories trading company which has customers in several countries. this data set includes 
    the Sales details over the period of 2011 - 2016. 
    This dataset has 18 fields and 113036 observations respectively.
    Please note: Financial records are in US Dollars.
 */

/* This Portfolio Project includes Aggregating, Summarizing and Basic Data Manipulations 
for the purpose of having a glance at Data over the surface. 
Dataset link: https://github.com/ine-rmotr-curriculum/FreeCodeCamp-Pandas-Real-Life-Example/blob/master/data/sales_data.csv
 */


/* 1. Exploring the Dataset */
SELECT 
	*
 FROM bikesale.bikesale;


/* 2. Revenue generated through different products */
SELECT 
    DISTINCT Product,
	Product_Category,
    SUM(Revenue) AS Revenue
FROM bikesale
GROUP BY Product,Product_Category;

/* 3. Revenue generated through sale of accessories */
SELECT 
    Product,
    SUM(Order_Quantity) AS Sold_Qty,
    SUM(Revenue) AS Prdcts_revenue,
    ROUND(SUM(Revenue) / SUM(Order_Quantity),0) AS Avg_Unit_Price
FROM bikesale.bikesale
WHERE Product_Category != "Bikes"
GROUP BY Product
ORDER BY SUM(Revenue) DESC;


/* 4. Revenue from Bikes */
SELECT 
    Product,
    Sub_category,
    SUM(Order_Quantity) AS Sold_Qty,
    SUM(Revenue) AS Prdcts_revenue,
    ROUND(SUM(Revenue) / SUM(Order_Quantity),0) AS Avg_Unit_Price
FROM bikesale.bikesale
WHERE Product_Category = 'Bikes'
GROUP BY Product, Sub_category
ORDER BY SUM(Revenue) DESC;

    /* 5. Summarizing Dataset Yearly: includes Total Revenue, Costs, Profit, Sold Qty */ 
SELECT
	Year,
	SUM(Order_Quantity) AS Sold_Qty,    /* Sold Qty of all products 2011-2016 */
    SUM(Revenue) AS Revenue,			/* Total revenue from sale of all products 2011-2016 */
    SUM(Profit) AS Profit,				/* Total Profit generated 2011-2016 */
	ROUND(SUM(Profit) / SUM(Cost) * 100,2) AS Profit_Margin		/* Profit Margin in % */    
FROM
	bikesale.bikesale
GROUP BY Year
ORDER BY Year;

/* 6. What is the Bikes Preference of different Gender in Countries */
 SELECT
	Country, Customer_Gender, Sub_Category,
	COUNT(Sub_Category) AS Qty_SubCatg
FROM
	bikesale
WHERE Product_Category = 'Bikes'
    GROUP BY Country, Customer_Gender, Sub_Category
ORDER BY Country;
	
