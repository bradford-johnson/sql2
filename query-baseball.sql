-- Find the average height of players born after 1950 for each birth country, sorted from high to low. Your query should only include countries who have a max height <= 75 inches. What is the fourth country that this query returns?
SELECT birthcountry, AVG(height) AS avg_height, MAX(height) AS max_height
FROM people
WHERE birthyear > 1950
GROUP BY birthcountry
HAVING(MAX(height)) <= 75
ORDER BY avg_height DESC;

-- For each birth year, find the average weight of players who both bat and throw with their left hand. Keep only the birth years where the average weight is greater than 200. Which birth year has the heaviest average weight?
SELECT DISTINCT(birthyear), AVG(weight) as avg_weight
FROM people
WHERE bats = 'L' 
AND throws = 'L'
GROUP BY birthyear
HAVING(AVG(weight)) > 200
ORDER BY avg_weight DESC;

--Which batting hand (the bats field) has the highest average height for all players weighing over 200 pounds?
SELECT bats, AVG(height) AS avg_height
FROM people
WHERE weight > 200
GROUP BY bats
ORDER BY avg_height DESC;

-- What is the average weight for all players who are born in the USA and bat left-handed, rounded to the nearest whole number?
SELECT ROUND(AVG(weight),0) AS avg_weight
FROM people
WHERE birthcountry = 'USA'
AND bats = 'L'
GROUP BY birthcountry, bats
ORDER BY avg_weight DESC;

-- For all players who have the first name of David, what is the height of the tallest player? Give the answer as a whole number in inches.
SELECT ROUND(MAX(height),0) AS max_height
FROM people
WHERE namefirst = 'David';