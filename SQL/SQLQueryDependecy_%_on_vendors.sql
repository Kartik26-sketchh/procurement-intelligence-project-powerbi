SELECT 
VendorNumber, VendorName,
SUM(Quantity) AS TotalQuantityPurchased,

SUM(Quantity) * 100.00 /
(SELECT SUM(Quantity) FROM purchases)
AS DependencyPercentage
from purchases
group by VendorNumber, VendorName
ORDER BY DependencyPercentage DESC;
