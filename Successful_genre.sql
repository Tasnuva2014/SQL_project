-- Find thetop three successful genres on each country based on profit.
use movies;
WITH Popular_genre AS(
select country.country_name,genre.genre_name,sum((movie.revenue-movie.budget))as profit,
row_number() OVER(PARTITION BY country.country_name ORDER BY sum((movie.revenue-movie.budget)) DESC) AS Rowno
from genre
join movie_genres on genre.genre_id=movie_genres.genre_id
join movie on movie.movie_id=movie_genres.movie_id
join production_country on movie.movie_id=production_country.movie_id
join country on country.country_id=production_country.country_id
group by 1,2
order by 1 ASC,3 DESC)
SELECT * FROM Popular_genre where profit>0 and Rowno<=3


