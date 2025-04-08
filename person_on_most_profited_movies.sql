-- Find the person whose acted movies made the most profit.Name the movies along with their ratings and profit.
WITH best_selling_person AS (
    SELECT 
        person.person_id,
        person.person_name,
        SUM(movie.revenue - movie.budget) AS profit
    FROM person
    JOIN movie_cast ON person.person_id = movie_cast.person_id
    JOIN movie ON movie_cast.movie_id = movie.movie_id
    GROUP BY person.person_id, person.person_name
    order by 3 DESC
    LIMIT 1
)


select person.person_id,person.person_name,movie.title,movie.vote_average as ratings,(movie.revenue-movie.budget) as profit_per_movie
from person
join movie_cast on person.person_id=movie_cast.person_id
join movie on movie_cast.movie_id=movie.movie_id
join best_selling_person bsp on bsp.person_id=movie_cast.person_id
order by 5 DESC;