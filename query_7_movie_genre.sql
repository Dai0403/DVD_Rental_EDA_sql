SELECT 
    cat.category_id, 
    cat.name, 
    COUNT(rental_id) AS rental_count
FROM 
    film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS cat ON fc.category_id = cat.category_id
INNER JOIN inventory AS i ON i.film_id =f.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY 
    cat.category_id, cat.name
ORDER BY 
    COUNT(rental_id) DESC;