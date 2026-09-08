WITH VendorLeadTime AS
(
    SELECT
        VendorName,
        VendorNumber,
        AVG(DATEDIFF(DAY, PODate, ReceivingDate)) AS AVGLeadTime,

        CASE
            WHEN AVG(DATEDIFF(DAY, PODate, ReceivingDate)) <= 7
                THEN 'Fast'
            WHEN AVG(DATEDIFF(DAY, PODate, ReceivingDate)) BETWEEN 8 AND 9
                THEN 'Normal'
            WHEN AVG(DATEDIFF(DAY, PODate, ReceivingDate)) BETWEEN 10 AND 12
                THEN 'Slow'
            ELSE 'Very Slow'
        END AS DeliveryRemark
    FROM dbo.purchases
    GROUP BY
        VendorName,
        VendorNumber
),

RankedVendors AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY AVGLeadTime ASC
        ) AS FastestRank,

        ROW_NUMBER() OVER (
            ORDER BY AVGLeadTime DESC
        ) AS SlowestRank
    FROM VendorLeadTime
)

SELECT
    VendorName,
    VendorNumber,
    AVGLeadTime,
    DeliveryRemark,

    FastestRank,
    SlowestRank,

    CASE
        WHEN FastestRank <= 5
            THEN 'Fastest'
        WHEN SlowestRank <= 5
            THEN 'Slowest'
        ELSE 'Other'
    END AS VendorGroup

FROM RankedVendors;