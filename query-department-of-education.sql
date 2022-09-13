-- 1
SELECT COLUMN_NAME , DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'naep';

-- 2
SELECT * 
FROM naep
LIMIT 50;

-- 3
SELECT state, COUNT(avg_math_4_score) AS count_4, AVG(avg_math_4_score) AS avg_4, MIN(avg_math_4_score) AS min_4, MAX(avg_math_4_score) AS max_4
FROM naep
GROUP BY state
ORDER BY state ASC;

-- 4
SELECT state, COUNT(avg_math_4_score) as count_4, AVG(avg_math_4_score) as avg_4, MIN(avg_math_4_score) as min_4, MAX(avg_math_4_score) as max_4
FROM naep
GROUP BY state
-- return records with difference of min and max > 30
HAVING(MAX(avg_math_4_score) - MIN(avg_math_4_score)) > 30;

-- 5
SELECT avg_math_4_score::float AS avg_score, state AS bottom_10_states
FROM naep
WHERE year = 2000
ORDER BY avg_score ASC
LIMIT 10;

-- 6
SELECT ROUND(AVG(avg_math_4_score),2) AS avg_math_4_score
FROM naep
WHERE year = 2000;

-- 7
SELECT state AS below_250 
FROM naep
WHERE avg_math_4_score < 250 AND year = 2000;

-- 8
SELECT state AS scores_missing_y2000
FROM naep
WHERE avg_math_4_score IS NULL AND year = 2000;

-- 9
SELECT n.state, ROUND(avg_math_4_score,2) AS avg_math_4_score, total_expenditure
FROM naep AS n
LEFT OUTER JOIN finance AS f
ON f.id = n.id
WHERE n.year = 2000 AND avg_math_4_score IS NOT NULL
ORDER BY total_expenditure DESC;