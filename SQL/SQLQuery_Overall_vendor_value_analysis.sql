WITH VendorMetrics AS
(
    SELECT
        v.VendorNumber,
        v.VendorName,
        v.AvgPurchasePrice,
        v.TotalSales,
        v.TotalProfit,
        d.AvgLeadTime
    FROM
    (
        SELECT
            VendorNumber,
            VendorName,
            AVG(PurchasePrice) AS AvgPurchasePrice,
            SUM(TotalSalesDollars) AS TotalSales,
            SUM(GrossProfit) AS TotalProfit
        FROM vendor_sales_summary
        GROUP BY VendorNumber, VendorName
    ) AS v

    INNER JOIN
    (
        SELECT
            VendorNumber,
            VendorName,
            AVG(DATEDIFF(day, PODate, ReceivingDate)) AS AvgLeadTime
        FROM purchases
        GROUP BY VendorNumber, VendorName
    ) AS d

    ON v.VendorNumber = d.VendorNumber
),

VendorScores AS
(
    SELECT
        *,
        
        (
            (MAX(AvgPurchasePrice) OVER () - AvgPurchasePrice)
            /
            NULLIF(
                MAX(AvgPurchasePrice) OVER ()
                - MIN(AvgPurchasePrice) OVER (),
                0
            )
        ) * 100 AS PurchasePriceScore,

        CASE
            WHEN AvgLeadTime <= 5 THEN 100
            WHEN AvgLeadTime <= 7 THEN 90
            WHEN AvgLeadTime <= 9 THEN 75
            WHEN AvgLeadTime <= 12 THEN 50
            WHEN AvgLeadTime <= 15 THEN 25
            ELSE 0
        END AS LeadTimeScore,

        10 + PERCENT_RANK() OVER (
            ORDER BY TotalSales
        ) * 90 AS SalesScore

    FROM VendorMetrics
)
  
SELECT top 10
    *,
    (
        SalesScore * 0.40
        + PurchasePriceScore * 0.30
        + LeadTimeScore * 0.30
    ) AS OverallVendorScore

FROM VendorScores
ORDER BY OverallVendorScore DESC;