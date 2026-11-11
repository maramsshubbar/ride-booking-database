select D.driverid as "Driver ID", D.firstname || ' ' || D.lastname as "Driver Name", min(R.rating) as "Minimum Rating"
from review R, driver D
where D.driverid=R.driverid
group by D.driverid, D.firstname, D.lastname
having min(R.rating) >3;
