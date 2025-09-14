-- customer who has spent the most money

SELECT
    c.customerFirstName,
    c.customerLastName,
    SUM(s.transactionTotalAmount) AS total_spent
FROM
    customer AS c
JOIN
    sales AS s ON c.customerID = s.customerID
GROUP BY
    c.customerID
ORDER BY
    total_spent DESC
LIMIT 1;