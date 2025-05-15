-- These create appropriate indexes for those high usage columns 
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_id ON Property(property_id);
