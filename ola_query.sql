create database ola;
ALTER TABLE ola_dataset
DROP COLUMN MyUnknownColumn;
alter table ola_dataset
DROP COLUMN `MyUnknownColumn_[0]`;
-- problem 1
create view successful_bookings as 
select * from ola_dataset
where Booking_Status='Success';
select * from successful_bookings;
-- problem 2
create view average_ride_dis_per_vehicle as
select vehicle_Type , round(avg(Ride_Distance),2) as avg_distance from ola_dataset
group by Vehicle_Type;
select * from average_ride_dis_per_vehicle;
-- problem 3
create view Canceled_rides_by_Customer as  
select count(*)  
from ola_dataset 
where Booking_Status='Canceled by Customer';
select * from Canceled_rides_by_Customer;
-- problem 4
create view top5_Customers as(
select Customer_ID , Count(Booking_ID) as total_rides from ola_dataset
group by Customer_ID
 order by Count(Booking_ID)  desc limit 5);
 select * from top5_Customers ;
-- problem 5
create view Canceled_Rides_by_Driver_P_C_Issues as 
select count(*) from ola_dataset where Canceled_Rides_by_Driver='Personal & Car related issue' or Canceled_Rides_by_Driver='personal and car related issue';
select * from Canceled_Rides_by_Driver_P_C_Issues;
-- problem 6
create view max_min_driver_rating as
select Vehicle_Type,max(Driver_Ratings) as max_rating,min(Driver_Ratings)as min_rating  from ola_dataset
where Vehicle_Type ='Prime Sedan';
select * from max_min_driver_rating;
-- problem 7
create view UPI_Payment_Method as 
select * from ola_dataset where Payment_Method='UPI';
select * from UPI_Payment_Method;
-- problem 8
create view avg_customer_ratings as 
select Vehicle_Type,round(avg (Customer_Rating),2) as avg_customer_rating
from ola_dataset
group by Vehicle_Type;
select * from avg_customer_ratings;
-- problem 9
create view  total_successful_ride_value as
select sum(Booking_Value) as total_successful_ride_value
from successful_bookings;
select * from total_successful_ride_value;
-- problem 10
SELECT 
    Booking_ID, 
    COALESCE(Incomplete_Rides_Reason, 'No Reason Provided') AS Incomplete_Rides_Reason
FROM ola_dataset
where Incomplete_Rides='Yes';