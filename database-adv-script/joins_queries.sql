-- INNER JOIN QUERY
-- This query retrieves a list of bookings along with user details by joining the 'Booking' table and the 'User' table.
SELECT Booking.booking_id, Booking.start_date, Booking.end_date, User.user_id, User.first_name, User.last_name, User.email
FROM Booking
INNER JOIN User
ON Booking.user_id = User.user_id

-- LEFT JOIN QUERY
-- This query retrieves all properties along with their reviews. If a property does not have any reviews, it will still be included in the result with the review fields as NULL.
SELECT Property.property_id, Property.name, Review.comment
FROM Property
LEFT JOIN Review
ON Property.property_id = Review.property_id

-- FULL OUTER JOIN QUERY
-- Construct a FULL OUTER JOIN query to fetch all users and all bookings, including users without bookings and bookings not associated with any user.
SELECT User.id, User.first_name, User.last_name, Booking.booking_id, Booking.start_date, Booking.end_date
FROM User
FULL OUTER JOIN Booking
ON User.id = Booking.user_id