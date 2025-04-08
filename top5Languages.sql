-- WHICH LANGUAGE MOVIES ARE POPULAR
-- what are the top languages on the basis of popularity
SELECT `language`.language_name,sum(movie.popularity) as total_popularity
FROM movie
join movie_languages on movie.movie_id=movie_languages.movie_id
join `language`on `language`.language_id=movie_languages.language_id
group by 1
order by 2 DESC
LIMIT 5;

