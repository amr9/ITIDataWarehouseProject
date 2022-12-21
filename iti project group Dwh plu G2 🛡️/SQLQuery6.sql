
"The marketing department wants to analyze what flights the company’s frequent flyers take"
select l.Destination_City, COUNT (l.Destination_City ) as most_visited
from Fact_Flight_Activity  f,Dim_Location l
where f.Location_ID =l.Location_ID

Group by Destination_City
order by most_visited desc;



" what fare basis they pay "

select f.Customer_ID,Fare_Basis,discount,price,(price-(discount*price)) as total_price 
from Fact_Flight_Activity f inner join Fact_Reservation r
on f.Customer_ID =r.Customer_ID ;







  " how they earn and redeem their frequent flyer miles "

select c.Firstname,c.Lastname,sum(f.Miles)as total_miles,c.Reward_Per_Mile
from Dim_Customer c , Fact_Flight_Activity f
where c.Customer_ID =f.Customer_ID
group by c.Firstname,c.Lastname,c.Reward_Per_Mile




"deterrmine whether they respond to special fare promotions or not "


select c.Customer_ID,c.Firstname,c.Lastname,Promo_respond 
from Fact_Flight_Activity f,Dim_Customer c
where f.Customer_ID=c.Customer_ID




" how long their overnight stays are"

select g.Airline_ID,g.Stops ,g.Duration 
from Fact_Flight_Activity f ,Dim_Flight g
where g.Airline_ID =f.Airline_ID




" what proportion of these frequent flyers have gold, platinum, aluminum, or titanium status."

select a.Status,(select distinct count(b.status) from Dim_Customer b where a.status=b.Status  )*100
/(select count (Is_Frequent)from Dim_Customer  where Is_Frequent =1  ) as prectange
from Dim_Customer a
group by Status













 
 
















 select l.Destination_City, COUNT (l.Destination_City ) as most_visited
from Fact_Flight_Activity  f,Dim_Location l
where f.Location_ID =l.Location_ID

Group by Destination_City
order by most_visited desc;