-- ==========================================================
-- DATABASE INDEX OPTIMIZATION SCRIPT
-- File: database_index.sql
-- Project: alx-airbnb-database
-- ==========================================================

-- 1. Index on User email (for faster login & lookups)
CREATE INDEX idx_user_email ON User (email);

-- 2. Index on Property ID (for quick joins)
CREATE INDEX idx_property_id ON Property (property_id);

-- 3. Index on Property host_id (for quick host property retrieval)
CREATE INDEX idx_property_host_id ON Property (host_id);

-- 4. Index on Booking ID (for joins with Payment)
CREATE INDEX idx_booking_id ON Booking (booking_id);

-- 5. Index on Booking user_id (for queries retrieving a user’s bookings)
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- 6. Optional: Index on Booking property_id (useful for property-based searches)
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- ==========================================================
-- CHECKING PERFORMANCE IMPROVEMENT
-- ==========================================================
-- Before creating indexes, run:
-- EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
-- After creating indexes, run the same command again and observe reduced query cost/time.
