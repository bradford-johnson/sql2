SELECT *
FROM transactions
RIGHT OUTER JOIN people
ON transactions.person_id = people.person_id
RIGHT OUTER JOIN books 
on transactions.book_id = books.book_id
WHERE people."name" = 'Connie';

SELECT name, SUM(fine) AS total_fine
FROM transactions
RIGHT OUTER JOIN people
ON transactions.person_id = people.person_id
RIGHT OUTER JOIN books 
on transactions.book_id = books.book_id
GROUP BY name;

SELECT title
FROM books
RIGHT OUTER JOIN transactions
ON books.book_id = transactions.book_id
WHERE transactions.return_date IS NULL;

SELECT name, COUNT(checkout_date) AS n_checkouts
FROM people
RIGHT OUTER JOIN transactions
ON people.person_id = transactions.person_id
GROUP BY name;

SELECT genre, SUM(fine) AS sum_fine
FROM books
RIGHT OUTER JOIN transactions
ON books.book_id = transactions.book_id
GROUP BY genre;

SELECT name, title
FROM people
RIGHT OUTER JOIN transactions
ON people.person_id = transactions.person_id
RIGHT OUTER JOIN books
ON transactions.book_id = books.book_id
WHERE name = 'Pearl';

SELECT name, return_date, title
FROM people
RIGHT OUTER JOIN transactions
ON people.person_id = transactions.person_id 
RIGHT OUTER JOIN books
ON transactions.book_id = books.book_id
WHERE name = 'Garnet';

SELECT name, title
FROM people 
RIGHT OUTER JOIN transactions
ON people.person_id = transactions.person_id
RIGHT OUTER JOIN books
ON transactions.book_id = books.book_id
WHERE title = 'The Hobbit';

SELECT name, fine
FROM people 
RIGHT OUTER JOIN transactions
ON people.person_id = transactions.person_id
RIGHT OUTER JOIN books
ON transactions.book_id = books.book_id
WHERE title = 'Crazy Rich Asians';
