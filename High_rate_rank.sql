	-- movie names on the ranking of ratings,then profit and popularity respectively
SELECT movie.title,
    AVG(popularity) AS avg_popularity,AVG(vote_average)as rating_avg,avg((movie.revenue-movie.budget))as profit,movie.release_date
    FROM person
    JOIN movie_cast ON person.person_id = movie_cast.person_id
    JOIN movie ON movie_cast.movie_id = movie.movie_id
    GROUP BY movie.title,movie.release_date
    order by 3 DESC,4 DESC,2 DESC
    LIMIT 10