SELECT 
[VendorNumber],
[VendorName],
COUNT(DISTINCT Description) AS UniqueProductsSupplied
FROM purchases
GROUP BY VendorNumber, VendorName
ORDER BY UniqueProductsSupplied DESC