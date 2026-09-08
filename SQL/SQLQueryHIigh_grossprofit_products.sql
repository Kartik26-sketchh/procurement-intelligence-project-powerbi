SELECT 
Description,
SUM(GrossProfit) AS TotalProfit,
SUM(TotalSalesDollars) AS TotalSales
FROM vendor_sales_summary
GROUP BY Description
ORDER BY TotalProfit DESC;