-- total quantity shoes sold for each brand
SELECT
    b.brandName,
    SUM(sd.salesQuantity) AS total_sold_by_brand
FROM
    brand AS b
JOIN
    Inventory AS i ON b.brandID = i.brandID
JOIN
    salesDetails AS sd ON i.shoeID = sd.shoeID
GROUP BY
    b.brandName
ORDER BY
    total_sold_by_brand DESC;