select D.driverid as "Driver ID", D.firstname || ' ' || D.lastname as "Driver Name", 
sum(P.paymentamount) as "Total Earnings for the Driver in the Current Year"
from driver D, ride R, payment P
where D.driverid=R.driverid
and R.paymentid=P.paymentid
and R.ridedate between '01-jan-2024' and '31-dec-2024'
group by D.driverid, D.firstname, D.lastname
order by D.driverid;
