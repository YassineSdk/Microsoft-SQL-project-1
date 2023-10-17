
--looking for the diff types of prodcts 
SELECT DISTINCT [Product] ,Unit_Price , Unit_Cost , (Unit_Price - Unit_Cost) AS Profit_per_Unit
FROM [dbo].[sales_data$] 

--identifying  diff types of prodct Category 
SELECT DISTINCT [Product_Category]
FROM [dbo].[sales_data$]

----- years
SELECT DISTINCT [Year]
FROM [dbo].[sales_data$]

---- Sub Category 
SELECT DISTINCT [Sub_Category]
FROM [dbo].[sales_data$]
----- Profit, Revenu,Cost  by years and 
SELECT [Year] , SUM(Profit) AS Total_Profit ,SUM(Cost) AS Total_COST , SUM(Revenue) AS total_revenue , (SUM(Profit) /SUM(Revenue) ) As Profit_Rasio
FROM [dbo].[sales_data$]
GROUP BY [Year] 
Order by [Year] ASC 
---- Profit, Revenu,Cost  by country and
SELECT [Country] , SUM(Profit) AS Total_Profit ,SUM(Cost) AS Total_COST , SUM(Revenue) AS total_revenue , (SUM(Profit) /SUM(Revenue) ) As Profit_Rasio
FROM [dbo].[sales_data$]
GROUP BY [Country] 
Order by SUM(Profit) DESC 

---- Profit, Revenu,Cost Product_Category by  and
SELECT [Product_Category] , SUM(Profit) AS Total_Profit ,SUM(Cost) AS Total_COST , SUM(Revenue) AS total_revenue , (SUM(Profit) /SUM(Revenue) ) As Profit_Rasio
FROM [dbo].[sales_data$]
GROUP BY [Product_Category]
Order by SUM(Profit) DESC 

------Studying CUSTERMS :
SELECT  [Sub_Category]  ,AVG([Customer_Age]) AS AVG_age , STDEV([Customer_Age]) as ECART_btw_ages ,SUM([Order_Quantity]) AS Quantity_sold ,
Case 
WHEN AVG([Customer_Age]) > 45 THEN 'old aged adults' 
WHEN AVG([Customer_Age]) Between 31 AND 40 THEN 'middle_Aged Adults'
WHEN AVG([Customer_Age]) Between 17 AND 30 THEN 'Young Adults'
WHEN AVG([Customer_Age]) < 16 THEN 'Child'
END 
FROM [dbo].[sales_data$] 
GROUP BY  [Sub_Category]