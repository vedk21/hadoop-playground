CREATE VIEW IF NOT EXISTS PopularMoviesIDs AS
SELECT movieID, COUNT(movieID) AS ratingsCount
FROM ratings
GROUP BY movieID
ORDER BY ratingsCount DESC;

SELECT movie_name, ratingsCount
FROM movies m JOIN PopularMoviesIDs p ON m.movieID = p.movieID;