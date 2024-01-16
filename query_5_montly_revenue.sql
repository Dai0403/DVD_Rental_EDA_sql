SELECT 
    TO_CHAR(r.rental_date, 'Month') AS month, 
    SUM(f.rental_rate) AS revenue
FROM 
    film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY 
    TO_CHAR(r.rental_date, 'Month'), 
    EXTRACT(MONTH FROM r.rental_date) 
ORDER BY 
    EXTRACT(MONTH FROM rental_date);