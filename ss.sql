Create Database Ola;
USE Ola;
#1. Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT * FROM bookings WHERE Booking_Status = 'Success';

#2. Find the average ride distance for each vehicle type:
CREATE VIEW average_ride_distance AS
SELECT Vehicle_Type, AVG(Ride_Distance) as avg_distance FROM bookings
GROUP BY Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_rides_by_customers As
SELECT COUNT(Booking_Status) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides FROM bookings
GROUP BY Customer_ID
ORDER BY Total_rides DESC LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW cancelled_by_driver_PC_issue AS
SELECT Canceled_Rides_by_Driver, 
COUNT(Canceled_Rides_by_Driver) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Ratings as 
SELECT MAX(Driver_Ratings) as max_ratings,
MIN(Driver_Ratings) as min_ratings
FROM bookings WHERE Vehicle_Type = 'Bike';

#7. Retrieve all rides where payment was made using UPI:
SELECT COUNT(*) Payment_Method FROM bookings
WHERE Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Cust_Rating AS
SELECT Vehicle_TYPE, AVG(Customer_Rating) as Avg_Cust_Rating
FROM bookings
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW Success_booking_rides as
SELECT SUM(Booking_value)
FROM bookings
WHERE Booking_Status = 'Success';

#10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides='Yes';


