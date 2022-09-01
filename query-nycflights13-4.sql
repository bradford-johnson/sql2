-- What is the average temperature for month 10? Round to a whole number.
SELECT ROUND(AVG(temp),0) AS avg_temp_oct
FROM weather
WHERE month = 10;

-- Which origin had the highest total precip?
SELECT origin, SUM(precip) as total_p
FROM weather
GROUP BY origin;

-- Which day has the following statistics?
-- Avg temp:	39.0675
-- Min temp:	32
-- Max temp:	46.04

SELECT day, month, MAX(temp) AS max_temp, MIN(temp) AS min_temp, AVG(temp) AS avg_temp
FROM weather
WHERE month IN (2,3) AND day IN (2,14,25,9)
GROUP BY day, month
ORDER BY max_temp;

-- Find the minimum visibility recorded for each origin and month, sorted low to high. What is the minimum visibility of the fifth record you return? 
SELECT origin, month, MIN(visib) AS min_v
FROM weather
GROUP BY origin, month
ORDER BY min_v ASC;

-- Find the minimum visibility recorded for each origin and month, sorted high to low. What is the minimum visibility of the sixth record you return? 
SELECT origin, month, MIN(visib) AS min_v
FROM weather
GROUP BY origin, month
ORDER BY min_v DESC;