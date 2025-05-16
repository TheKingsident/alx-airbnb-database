CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);

CREATE TABLE Booking_2023
    PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE Booking_2024
    PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');


EXPLAIN SELECT b.booking_id, b.property_id, b.user_id
FROM Booking b
WHERE start_date >= '2023-01-01' AND start_date < '2024-01-01'
ORDER BY start_date DESC;

