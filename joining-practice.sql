SELECT *
FROM nicolas_cage_movies INNER JOIN movie_genre
ON movie_genre.movie_id = nicolas_cage_movies.movie_id;

SELECT  movie_genre.movie_id, genre, movie_name 
FROM movie_genre LEFT OUTER JOIN nicolas_cage_movies
ON nicolas_cage_movies.movie_id = movie_genre.movie_id;