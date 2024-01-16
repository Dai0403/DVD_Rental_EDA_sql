SELECT
    rental_duration,
    COUNT(film_id) AS film_count
FROM   
    film 
GROUP BY 
    rental_duration
ORDER BY 
    rental_duration asc;