WITH WEATHER_LAG AS (
    SELECT
        ID,
        RECORDDATE,
        TEMPERATURE,
        LAG(RECORDDATE) OVER (ORDER BY RECORDDATE)  AS PREVIOUS_RECORDDATE,
        LAG(TEMPERATURE) OVER (ORDER BY RECORDDATE) AS PREVIOUS_TEMPERATURE
    FROM
        WEATHER
)
SELECT
    ID
FROM
    WEATHER_LAG
WHERE
    TEMPERATURE > PREVIOUS_TEMPERATURE
    AND RECORDDATE - PREVIOUS_RECORDDATE = 1;