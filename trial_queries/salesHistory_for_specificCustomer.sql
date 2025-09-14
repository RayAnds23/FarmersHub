-- sales history for a specific customer
SELECT
    c.customerFirstName,
    c.customerLastName,
    s.salesID,
    s.salesDate,
    s.transactionTotalAmount
FROM
    customer AS c
JOIN
    sales AS s ON c.customerID = s.customerID
WHERE
    c.customerID = 1001;
