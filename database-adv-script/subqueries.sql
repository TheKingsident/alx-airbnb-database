-- This query selects all properties from the Property table where the property_id
-- matches the id of properties that have at least one review with a rating greater than 4.
SELECT * FROM Property
WHERE property_id IN (
    SELECT property.id
    FROM Review
    WHERE AVG(rating) > 4
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
