SELECT 
    cat.name, 
    ROUND(avg(f.rental_duration), 2) AS avg_rental_duration
FROM 
    film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS cat ON fc.category_id = cat.category_id
GROUP BY 
    cat.name
ORDER BY 
    avg(f.rental_duration) DESC;
	