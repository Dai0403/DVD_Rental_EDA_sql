SELECT 
    f.film_id,
    f.title,
    f.rental_duration,
    SUM(CASE WHEN date(return_date) - date(rental_date) > rental_duration THEN 1 ELSE 0 END) AS late_returns
FROM 
    rental AS r
INNER JOIN inventory AS i ON i.inventory_id = r.inventory_id --1. but not counting the rental_id here. just joined them.
INNER JOIN film AS f ON  f.film_id= i.film_id --2. join the table above with film table to get the whole joind table that is needed whose primary key here is rental_id -> can't count rental_id. count the film_id or title
GROUP BY 
    f.film_id
ORDER BY 
    late_returns DESC
    LIMIT 10;