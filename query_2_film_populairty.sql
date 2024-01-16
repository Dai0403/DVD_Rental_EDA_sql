SELECT 
    film.film_id,
    film.title, 
    COUNT(*) AS total_rental
FROM 
    rental 
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id 
INNER JOIN film ON  film.film_id= inventory.film_id 
GROUP BY 
    film.film_id
ORDER BY 
    total_rental DESC
    LIMIT 10;