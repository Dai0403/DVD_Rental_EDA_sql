SELECT 
    SUM(CASE WHEN date(return_date) - date(rental_date) <= rental_duration THEN 1 ELSE 0 END) AS normal_returns,
    SUM(CASE WHEN date(return_date) - date(rental_date) > rental_duration THEN 1 ELSE 0 END) AS late_returns
FROM 
    film AS f
INNER JOIN inventory AS i ON f.film_id = i.film_id
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id;