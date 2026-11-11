select P.passengerid as "Passenger ID", P.firstname || ' ' ||  P.lastname as "Passenger Name who have used CityWheelsBH more than 20 times" 
from passenger P, ride R
where P.passengerid=R.passengerid
group by P.passengerid, P.firstname, P.lastname
having count(R.rideid)> 20;
