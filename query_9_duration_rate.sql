WITH film_groups AS 
    (SELECT 
    film_id,
    rental_duration,
    rental_rate, 
    CASE rental_rate
      WHEN 4.99 THEN 'rate_4.99'
      WHEN 2.99 THEN 'rate_2.99'
      ELSE 'rate_0.99' 
      END AS rate_group
FROM 
    film)
SELECT 
    rate_group,
    ROUND(AVG(rental_duration),2) AS avg_duration,
    COUNT(film_id) AS film_count
FROM 
    film_groups
GROUP BY
    rate_group
ORDER BY 
    rate_group;