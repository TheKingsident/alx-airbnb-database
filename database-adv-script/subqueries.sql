SELECT * FROM Property
WHERE property_id IN (
    SELECT property.id
    FROM Review
    WHERE rating > 4
);
