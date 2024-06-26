WITH HELPER AS(
    SELECT
        PRODUCT_ID,
        TO_CHAR(ORDER_DATE, 'YYYY-MM') AS OD,
        SUM(UNIT)                      AS UNIT
    FROM
        ORDERS
    GROUP BY
        PRODUCT_ID,
        TO_CHAR(ORDER_DATE, 'YYYY-MM')
    HAVING
        TO_CHAR(ORDER_DATE, 'YYYY-MM') = '2020-02'
        AND SUM(UNIT) >= 100
)
SELECT
    PRODUCT_NAME,
    UNIT
FROM
    HELPER
    NATURAL JOIN PRODUCTS;