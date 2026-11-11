select avg(RE.rating)
from review RE, ride R, driver D
where RE.rideid=R.rideid
and R.driverid=D.driverid
group by D.driverid
having count(R.rideid) > 50;
