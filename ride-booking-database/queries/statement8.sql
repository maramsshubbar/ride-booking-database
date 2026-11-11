create table Query1 AS (select RequestType, Count(*) as Total 
from Support_Request group by RequestType);
select RequestType as "Most Common Issue", Total from Query1 where Total = (select Max(Total) from Query1);
