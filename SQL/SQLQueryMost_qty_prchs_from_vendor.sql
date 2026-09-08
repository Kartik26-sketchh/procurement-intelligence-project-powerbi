SELECT 
VendorNumber, VendorName,
SUM(Quantity) AS TotalQuantityPurchased
FROM purchases
GROUP BY VendorNumber, VendorName
ORDER BY TotalQuantityPurchased DESC;

