-- Find all shoes made by a specific brand (nike)
SELECT
    i.shoeName,
    i.colorway,
    i.shoeSize,
    i.shoePrice
FROM
    Inventory AS i
JOIN
    brand AS b ON i.brandID = b.brandID
WHERE
    b.brandName = 'Nike';