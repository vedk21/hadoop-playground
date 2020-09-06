ratings = LOAD '/user/maria_dev/ml-100k/u.data' AS (userId: int, movieID: int, rating: int, ratingTime: int);

moviesMetadata = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') AS (movieID: int, movieTitle: chararray, releaseDate: chararray);

dateRefactoredMoviesMetadata = FOREACH moviesMetadata GENERATE movieID, movieTitle, ToUnixTime(ToDate(releaseDate, 'dd-MMM-yyyy')) AS releaseTime;

groupedRatings = GROUP ratings BY movieID;

avgRatings = FOREACH groupedRatings GENERATE group AS movieID, AVG(ratings.rating) AS avgRating;

fiveStarMovies = FILTER avgRatings BY avgRating > 4;

joinedMoviesRatings = JOIN fiveStarMovies BY movieID, dateRefactoredMoviesMetadata BY movieID;

orderedMoviesByRatings = ORDER joinedMoviesRatings BY dateRefactoredMoviesMetadata::releaseTime;

DUMP orderedMoviesByRatings;