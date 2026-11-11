select D.driverid as "Driver ID", D.firstname || ' ' || D.lastname as "Driver Name", count(R.rideid) as "Total Rides Completed"
from driver D, ride R
where D.driverid=R.driverid
and R.status = 'Completed'
group by D.driverid, D.firstname,D.lastname
order by D.driverid;
