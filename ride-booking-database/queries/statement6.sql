select D.driverid as "Driver ID", D.firstname || ' ' ||  D.lastname as "Driver Name"
from driver D, ride R, passenger P
where D.driverid = R.driverid 
and R.passengerid=P.passengerid
and R.status = 'Completed'
group by D.driverid, D.firstname, D.lastname 
having count(distinct P.passengerid) >= 3;
