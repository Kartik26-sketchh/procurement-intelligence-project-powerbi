SELECT 
[VendorName], 
[VendorNumber],
AVG(PurchasePrice) AS AVGPurchasePrice
FROM purchases
GROUP BY VendorName,VendorNumber
ORDER BY AVGPurchasePrice DESC;