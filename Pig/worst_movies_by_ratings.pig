ratings = LOAD '/user/maria_dev/ml-100k/u.data' AS (userId: int, movieID: int, rating: int, ratingTime: int);

moviesMetadata = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') AS (movieID: int, movieTitle: chararray);

groupedRatings = GROUP ratings BY movieID;

avgRatings = FOREACH groupedRatings GENERATE group AS movieID, AVG(ratings.rating) AS avgRating, COUNT(ratings.rating) AS totalRating;

badMovies = FILTER avgRatings BY avgRating < 2;

joinedMoviesRatings = JOIN badMovies BY movieID, moviesMetadata BY movieID;

orderedMoviesByRatings = ORDER joinedMoviesRatings BY badMovies::totalRating DESC;

DUMP orderedMoviesByRatings;