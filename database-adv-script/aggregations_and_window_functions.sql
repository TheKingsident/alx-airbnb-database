-- Finds the total number of bookings made by each user.
SELECT b.user_id, COUNT(*) AS booking_count
FROM Booking b
GROUP BY b.user_id

