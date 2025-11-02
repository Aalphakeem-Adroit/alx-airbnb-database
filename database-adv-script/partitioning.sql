-- Drop existing partitioned table if it exists
DROP TABLE IF EXISTS Booking_partitioned;

-- Create a partitioned version of the Booking table based on start_date
CREATE TABLE Booking_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY RANGE (start_date);

-- Create partitions based on year
CREATE TABLE Booking_2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Indexes for optimization within partitions
CREATE INDEX idx_booking2023_start_date ON Booking_2023(start_date);
CREATE INDEX idx_booking2024_start_date ON Booking_2024(start_date);
CREATE INDEX idx_booking2025_start_date ON Booking_2025(start_date);

-- Query to test performance on partitioned table
EXPLAIN ANALYZE
SELECT *
FROM Booking_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';