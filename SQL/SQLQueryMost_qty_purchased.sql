SELECT
Description,
SUM(Quantity) as totalquantity
from purchases
GROUP BY Description
order by totalquantity DESC;