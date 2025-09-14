-- total revenue

SELECT
    SUM(transactionTotalAmount) AS total_revenue
FROM
    sales;
