DROP VIEW PopularMoviesIDs;

CREATE VIEW IF NOT EXISTS PopularMoviesIDs AS
SELECT movieID, COUNT(movieID) AS rating_count, AVG(rating) AS avg_rating
FROM ratings
GROUP BY movieID;

SELECT movie_name, avg_rating, rating_count
FROM movies m JOIN PopularMoviesIDs p ON m.movieID = p.movieID
WHERE rating_count > 10
ORDER BY avg_rating DESC
LIMIT 10;