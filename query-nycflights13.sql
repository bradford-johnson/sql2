SELECT COUNT(*)
FROM planes
WHERE year >= 2000;

SELECT COUNT(*)
FROM planes
WHERE manufacturer = 'BOEING';

SELECT COUNT(*)
FROM planes
WHERE manufacturer = 'Boeing';

SELECT COUNT(*)
FROM planes
WHERE year BETWEEN 1980 AND 1990;

SELECT COUNT(*)
FROM planes
WHERE manufacturer IN('CESSNA','BOEING','AIRBUS')

SELECT COUNT(*)
FROM planes
WHERE year IS NULL;

SELECT COUNT(*)
FROM planes
WHERE speed IS NULL;

SELECT COUNT(*)
FROM planes
WHERE seats < 50
OR seats > 200;

SELECT COUNT(*)
FROM planes
WHERE engine LIKE 'Turbo%';

SELECT COUNT(*)
FROM planes
WHERE model LIKE '___-___';

SELECT COUNT(*)
FROM planes
WHERE year < 1980
AND seats > 100;

SELECT COUNT(*)
FROM planes
WHERE year > 2000
OR engine = 'Reciprocating';

SELECT *
FROM planes
LIMIT 200;

SELECT COUNT(*)
FROM planes
WHERE year BETWEEN 1980 AND 1990
AND engines <> 2
AND speed IS NOT NULL
AND manufacturer IN ('BOEING','CESSNA');

SELECT COUNT(*)
FROM planes
WHERE year BETWEEN 1980 AND 1990
AND engines <> 2
AND speed IS NOT NULL
OR manufacturer IN ('BOEING', 'CESSNA');

SELECT COUNT(*)
FROM planes
WHERE year BETWEEN 1980 AND 1990
AND engines <> 2
AND speed IS NOT NULL 
OR manufacturer IN ('BOEING','CESSNA');