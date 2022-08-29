--- How many unique values of "type" are there? 
SELECT COUNT(DISTINCT type) 
FROM planes;

-- Match the year to the number of records.
SELECT year, COUNT(year) 
FROM planes 
WHERE year IN (2004,2005,2006) 
GROUP BY year;

-- How many records for the "engine" = 'Turbo-jet' are there?
SELECT COUNT(engine) 
FROM planes 
WHERE engine = 'Turbo-jet';

-- Which "engine" type has the most records?

SELECT engine, COUNT(engine) 
FROM planes 
GROUP BY engine;

-- How many years is the "BOEING" manufacturer 
-- and the "757-222" model in the database?

SELECT COUNT(DISTINCT year) 
FROM planes 
WHERE model = '757-222';