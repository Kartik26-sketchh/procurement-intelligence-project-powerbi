SELECT
    VendorName,
    VendorNumber,
    SUM(TotalPurchaseDollars) AS TotalPurchase,
    SUM(TotalSalesDollars) AS TotalSales,
    SUM(TotalSalesDollars) - SUM(TotalPurchaseDollars) AS Difference
FROM vendor_sales_summary
GROUP BY
    VendorName,
    VendorNumber
ORDER BY
    Difference DESC;