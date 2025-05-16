-- Initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT *
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id;

-- Refactored query that retrieves detailed booking information, including user, property, and payment details, by joining related tables.
SELECT 
    b.booking_id, b.property_id, b.user_id, b.start_date, b.end_date,
    u.first_name, u.last_name,
    p.name AS property_name, p.location,
    py.amount, py.payment_date
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
LEFT JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment py ON b.booking_id = py.booking_id;

