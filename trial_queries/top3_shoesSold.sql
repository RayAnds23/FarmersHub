-- top 3 selling shoes by quantity sold

SELECT
    i.shoeName,
    SUM(sd.salesQuantity) AS total_quantity_sold
FROM
    salesDetails AS sd
JOIN
    Inventory AS i ON sd.shoeID = i.shoeID
GROUP BY
    i.shoeName
ORDER BY
    total_quantity_sold DESC
LIMIT 3;