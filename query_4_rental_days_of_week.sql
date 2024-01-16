SELECT 
    TO_CHAR(rental_date, 'Day') AS day_of_week, 
    COUNT(rental_id)
FROM 
    rental 
GROUP BY 
    TO_CHAR(rental_date, 'Day'), 
    TO_CHAR(rental_date, 'D') 
ORDER BY TO_CHAR(rental_date, 'D') ASC;
