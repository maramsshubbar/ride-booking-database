with subquery AS (
SELECT locationname AS Popular_Destination, COUNT(*) AS total_ride
From ride
Group by locationname)
select Popular_Destination, total_ride from subquery where total_ride = ( select
MAX(total_ride) FROM subquery);
