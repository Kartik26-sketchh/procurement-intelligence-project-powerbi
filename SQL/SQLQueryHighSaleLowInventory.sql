WITH SalesByProduct AS
(
    SELECT
        Description,
        SUM(TotalSalesDollars) AS TotalSales
    FROM vendor_sales_summary
    GROUP BY Description
),

InventoryByProduct AS
(
    SELECT
        Description,
        SUM(onHand) AS EndingInventory
    FROM end_inventory
    GROUP BY Description
),

ProductMetrics AS
(
    SELECT
        s.Description,
        s.TotalSales,
        i.EndingInventory
    FROM SalesByProduct AS s
    INNER JOIN InventoryByProduct AS i
        ON s.Description = i.Description
),

RankedProducts AS
(
    SELECT
        *,
        NTILE(5) OVER (
            ORDER BY TotalSales DESC
        ) AS SalesGroup,

        NTILE(5) OVER (
            ORDER BY EndingInventory ASC
        ) AS InventoryGroup
    FROM ProductMetrics
)

SELECT
    Description,
    TotalSales,
    EndingInventory
FROM RankedProducts
WHERE SalesGroup = 1
  AND InventoryGroup = 1
ORDER BY TotalSales DESC;