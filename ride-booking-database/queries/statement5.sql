SELECT EXTRACT(MONTH FROM ridedate) AS month_number,
TO_CHAR(ridedate, 'Month') AS month_name,
COUNT(*) AS "Total_Rides"
FROM ride
WHERE EXTRACT(YEAR FROM ridedate) = EXTRACT(YEAR FROM CURRENT_DATE)
AND status = 'Completed'
GROUP BY EXTRACT(MONTH FROM ridedate), TO_CHAR(ridedate, 'Month')
ORDER BY month_number;
