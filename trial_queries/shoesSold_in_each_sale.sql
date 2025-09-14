-- which shoes were sold in each sale

SELECT
    s.salesID,
    i.shoeName,
    i.colorway,
    sd.salesQuantity
FROM
    sales AS s
JOIN
    salesDetails AS sd ON s.salesID = sd.salesID
JOIN
    Inventory AS i ON sd.shoeID = i.shoeID
ORDER BY
    s.salesID;