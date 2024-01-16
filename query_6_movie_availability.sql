SELECT 
    f.film_id, 
    f.title, 
    COUNT(i.inventory_id) AS inventories
FROM 
    film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
GROUP BY 
    f.film_id, f.title
ORDER BY 
    inventories DESC;