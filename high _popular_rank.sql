-- movie names on the ranking of popularity then profit and rating respectively
SELECT movie.title,movie.release_date,
	AVG(popularity) AS avg_popularity,avg((movie.revenue-movie.budget))as profit,AVG(vote_average)as rating_avg
    FROM person
    JOIN movie_cast ON person.person_id = movie_cast.person_id
    JOIN movie ON movie_cast.movie_id = movie.movie_id
    GROUP BY movie.title,movie.release_date
    order by 3 DESC,4 DESC,5 DESC
    LIMIT 10