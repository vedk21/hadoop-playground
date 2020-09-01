from mrjob.job import MRJob
from mrjob.step import MRStep

class PopularMoviesBreakdown(MRJob):
  def steps(self):
    return [
      MRStep(mapper=self.mapper_get_movies, reducer=self.reducer_avg_movies),
      MRStep(reducer=self.reducer_count_movies)
    ]

  def mapper_get_movies(self, _, line):
    (userID, movieID, rating, timestamp) = line.split('\t')
    yield movieID, float(rating)

  def reducer_avg_movies(self, key, values):
    ratings = [rating for rating in values]
    yield str(int(round(sum(ratings)/len(ratings)))).zfill(5), key

  def reducer_count_movies(self, count, movies):
    for movie in movies:
      yield movie, count

if __name__ == '__main__':
  PopularMoviesBreakdown.run()
