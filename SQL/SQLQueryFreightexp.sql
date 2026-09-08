SELECT
VendorNumber,
VendorName,
SUM(TotalPurchaseDollars) AS TotalPurchaseValue,
MAX(FreightCost) AS TotalFreightCost,
MAX(FreightCost) * 100
/
NULLIF(SUM(TotalPurchaseDollars), 0)
AS FreightCostPercentage
FROM vendor_sales_summary
GROUP BY VendorNumber, VendorName
ORDER BY TotalFreightCost DESC;

