SELECT
    VendorNumber,
    VendorName,
    SUM(TotalPurchaseDollars) AS TotalPurchaseValue,
    SUM(TotalExciseTax) AS TotalExciseTax,
    MAX(FreightCost) AS FreightCost,
    SUM(TotalPurchaseDollars)
        + SUM(TotalExciseTax)
        + MAX(FreightCost) AS TotalProcurementSpend
FROM [RetailsupplychainDB].[dbo].[vendor_sales_summary]
GROUP BY
    VendorNumber,
    VendorName
ORDER BY
    TotalProcurementSpend DESC;