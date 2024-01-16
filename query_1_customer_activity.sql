WITH consecutive AS (SELECT
    customer_id,
    rental_id,
    rental_date,
    inventory_id,
    LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS prev_rental_date,
    rental_date - LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS time_between_rentals,
    COUNT(rental_id) OVER (PARTITION BY customer_id) AS rental_count
FROM
    rental AS r
ORDER BY
    customer_id, rental_date)
--main 
SELECT 
    customer_id,
    rental_count,
    SUM(f.rental_rate) AS total_revenue, 
    ROUND(AVG(f.rental_rate),2) AS avg_rental_rate, 
    CONCAT(
        EXTRACT(DAY FROM AVG(time_between_rentals)) || ' day ',
        EXTRACT(HOUR FROM AVG(time_between_rentals)) || ' hours'
    ) AS avg_between_time
FROM
    consecutive
INNER JOIN inventory AS i ON i.inventory_id = consecutive.inventory_id
INNER JOIN film AS f ON i.film_id = f.film_id
GROUP BY 
    customer_id, rental_count
ORDER BY 
    rental_count DESC, 
    AVG(time_between_rentals) ASC;