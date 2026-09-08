WITH InventoryByProduct AS 
(
SELECT 
Description,
SUM(onHand) AS EndingInventory,
SUM(onHand * Price) AS InventoryValue
FROM end_inventory
GROUP BY Description
),
SalesByProduct AS 
(
SELECT 
Description,
SUM(TotalSalesDollars) AS TotalSales
FROM vendor_sales_summary
GROUP BY Description
)
SELECT 
i.Description,
i.EndingInventory,
i.InventoryValue,
COALESCE(s.TotalSales, 0) AS TotalSales
FROM InventoryByProduct AS i
LEFT JOIN SalesByProduct AS s
ON i.Description = s.Description
ORDER BY EndingInventory desc;