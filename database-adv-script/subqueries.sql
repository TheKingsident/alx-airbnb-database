-- This query selects all properties from the Property table where the property's
-- average review rating is greater than 4.
SELECT * FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


-- This query selects the id, first name, and last name of users
-- who have made more than 3 bookings.
SELECT User.id, User.first_name, User.last_name
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking
    WHERE Booking.user_id = User.id
) > 3;
