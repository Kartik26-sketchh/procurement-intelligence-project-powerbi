SELECT 
Description,
SUM(TotalExciseTax) AS TotalExciseTax,
SUM(TotalSalesDollars) AS TotalSales,
SUM(TotalPurchaseDollars) AS TotalPurchase,
SUM(TotalExciseTax) * 100 
/
NULLIF(SUM(TotalSalesDollars), 0) AS TaxToSalesPercentage,
SUM(TotalExciseTax) * 100
/
NULLIF(SUM(TotalPurchaseDollars), 0) AS TaxToPurchasePercentage
From vendor_sales_summary
GROUP BY Description
ORDER BY TaxToSalesPercentage DESC;

