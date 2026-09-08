SELECT
    VendorNumber,
    VendorName,
    SUM(TotalSalesDollars) AS TotalSales,
    SUM(GrossProfit) AS TotalProfit,
    SUM(GrossProfit) / NULLIF(SUM(TotalSalesDollars), 0) * 100 AS ProfitMargin
FROM vendor_sales_summary
GROUP BY
    VendorNumber,
    VendorName
HAVING
    SUM(TotalSalesDollars) > 1000000
ORDER BY
    ProfitMargin DESC;