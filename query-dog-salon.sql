-- 1. Which dogs (petIDs) did not come in for any service during the week 6/16 to 6/22?
SELECT o.pet_id, date
FROM owners AS o LEFT OUTER JOIN transactions AS t
ON t.pet_id = o.pet_id
WHERE date IS NULL;

-- Which was the busiest day during the week of 616 to 622 (more clients = busier)
SELECT date, COUNT(pet_id) AS count_visits
FROM transactions
GROUP BY date
ORDER BY count_visits DESC
LIMIT 1;

-- Using only the owners and visits tables (don't use the owners2 or transactions tables!), how many total visits does each owner have
SELECT owner_id, SUM(visits_count)
FROM owners
INNER JOIN visits ON visits.pet_id = owners.pet_id
GROUP BY owner_id
ORDER BY owner_id ASC;

-- The dog grooming salon had a special promotion going on that week. Whichever dog came in three or more times got a special toy! Which dogs (identified by petID) got the toy
SELECT pet_id, count(pet_id) AS count_visits
FROM transactions
GROUP BY pet_id
ORDER BY count_visits DESC;

-- What was the most common service done for large dogs during this week
SELECT service, count(service) AS count_services
FROM transactions
INNER JOIN owners ON owners.pet_id = transactions.pet_id
WHERE size = 'large'
GROUP BY service
ORDER BY count_services DESC;

-- Every owner who has had ten total visits gets the eleventh one free!  (Multiple dogs in the same visit are considered as individual visits.) Did anyone get a free service this week If so, who
SELECT owner_id, SUM(visits_count) AS n_visits
FROM owners
INNER JOIN visits ON owners.pet_id = visits.pet_id
GROUP BY owner_id

-- What are the highest and lowest ownerID values in both owners and owners2
SELECT MIN(owner_id) AS min_id, MAX(owner_id) AS max_id
FROM owners
UNION
SELECT MIN(owner_id) AS min_id, MAX(owner_id) AS max_id
FROM owners_2
ORDER BY min_id ASC, max_id DESC
LIMIT 1;