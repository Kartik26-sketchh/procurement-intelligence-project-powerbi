SELECT 
Description,
SUM(onHand) AS EndingInventory
FROM end_inventory
GROUP BY Description
ORDER BY EndingInventory DESC;