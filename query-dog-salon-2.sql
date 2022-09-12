SELECT owner_id, transaction_id, service
FROM owners AS o
RIGHT JOIN transactions AS t
ON t.pet_id = o.pet_id
ORDER BY owner_id;

SELECT owner_id, o.pet_id, transaction_id, visits_count
FROM owners AS o
LEFT JOIN transactions AS t
ON t.pet_id = o.pet_id
LEFT JOIN visits AS v
ON v.pet_id = t.pet_id
WHERE transaction_id IS NOT NULL
ORDER BY transaction_id;

SELECT o.pet_id, size, visits_count AS num_visits
FROM owners AS o
LEFT JOIN visits AS v
ON v.pet_id = o.pet_id
WHERE visits_count >= 10
ORDER BY num_visits DESC;

SELECT owner_id
FROM owners 
UNION
SELECT owner_id
FROM owners_2
ORDER BY owner_id;

SELECT owner_id, SUM(visits_count) AS num_visits
FROM owners AS o
LEFT JOIN visits AS v
ON v.pet_id = o.pet_id
GROUP BY owner_id
ORDER BY num_visits DESC
LIMIT 3;

SELECT owners.owner_id, transaction_id, date, service  
FROM owners LEFT OUTER JOIN transactions 
ON owners.pet_id = transactions.pet_id 
WHERE transaction_id IS NOT NULL 
UNION ALL  
SELECT owners_2.owner_id, transaction_id, date, service  
FROM owners_2 LEFT OUTER JOIN transactions 
ON owners_2.pet_id = transactions.pet_id 
WHERE transaction_id IS NOT NULL 
ORDER BY date, transaction_id; 

SELECT concat(owner_id,', ', owners.pet_id) AS owner_pet, visits_count 
FROM owners LEFT OUTER JOIN visits 
ON owners.pet_id = visits.pet_id 
WHERE visits_count >= 3 
UNION ALL  
SELECT concat(owner_id,', ', owners_2.pet_id) AS owner_pet, visits_count 
FROM owners_2 LEFT OUTER JOIN visits 
ON owners_2.pet_id = visits.pet_id 
WHERE visits_count >= 3 
ORDER BY visits_count DESC, owner_pet; 

SELECT owner_id, v.pet_id, visits_count
FROM visits AS v
INNER JOIN owners AS o
  ON v.pet_id = o.pet_id
ORDER BY visits_count DESC;

SELECT owner_id, owners.pet_id, date, service 
FROM transactions 
LEFT OUTER JOIN owners 
ON owners.pet_id = transactions.pet_id 
WHERE date = '2019-06-17' OR service = 'haircut' 
ORDER BY date; 

SELECT pet_id, service, 
  CASE 
    WHEN service = 'nails' THEN 'gift' 
    ELSE 'no gift' 
  END AS get_gift 
FROM transactions 
ORDER BY get_gift; 

SELECT date, COUNT(*)
FROM transactions
WHERE date IN ('2019-06-17', '2019-06-18')
GROUP BY date;

WITH all_owners AS 
(SELECT * FROM owners 
UNION ALL 
SELECT * FROM owners_2) 
SELECT size, COUNT(size) AS size_count 
FROM all_owners 
GROUP BY size 
ORDER BY size DESC;