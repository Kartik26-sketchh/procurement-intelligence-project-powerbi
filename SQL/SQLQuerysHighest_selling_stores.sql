WITH StoreSales AS 
(
SELECT
Store,
SUM(SalesDollars) AS TotalSales
FROM sales
group by Store
),
StoreRanked AS 
(
SELECT
Store,
TotalSales,
SUM(TotalSales) OVER () AS CompanyTotalSales,
SUM(TotalSales) OVER 
(
ORDER BY TotalSales DESC
ROWS BETWEEN UNBOUNDED 
PRECEDING AND CURRENT ROW
) AS CumlativeSales
FROM StoreSales
)
SELECT 
Store,
TotalSales,
TotalSales * 100 /
NULLIF(CompanyTotalSales, 0)
AS SalesPercentage, CumlativeSales * 100 /
NULLIF(CompanyTotalSales, 0) AS CumlativeSalesPercentage
FROM StoreRanked
ORDER BY TotalSales DESC
;