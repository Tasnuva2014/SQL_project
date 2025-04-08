-- FIND THE HIGHEST RATED MOVIES.
with highest_rate as(
  select movie.title,movie.popularity as popularity_per_movie,movie.vote_average as rating,
  (movie.revenue-movie.budget)as profit,`language`.language_name
  from person
  join movie_cast on person.person_id=movie_cast.person_id
  join movie on movie_cast.movie_id=movie.movie_id
  join movie_languages on movie.movie_id=movie_languages.movie_id
  join `language`on `language`.language_id=movie_languages.language_id
  where 
  movie.vote_average >=
  (select MAX(vote_average)
  FROM movie)
  order by 2 DESC
  )
SELECT DISTINCT *
FROM highest_rate;