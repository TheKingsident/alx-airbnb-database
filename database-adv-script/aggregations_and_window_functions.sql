-- Finds the total number of bookings made by each user.
SELECT b.user_id, COUNT(*) AS booking_count
FROM Booking b
GROUP BY b.user_id

-- This query retrieves each property's ID and name, counts how many bookings each property has, and ranks the properties by booking count in descending order. It uses window functions (RANK and ROW_NUMBER) to assign a rank and a unique row number to each property based on their booking
SELECT p.property_id, p.name,
         COUNT(b.booking_id) AS booking_count
         RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
         ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name