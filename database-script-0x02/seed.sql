-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', 09012345678, 'host'),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', 09012345678, 'guest'),
(UUID(), 'Admin', 'User', 'admin@airbnb.com', 'hashed_password_3', 09012345678, 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE email='john.doe@example.com'),
'Seaside Apartment', 'Beautiful ocean-view apartment.', 'Lagos, Nigeria', 150.00),
(UUID(), (SELECT user_id FROM User WHERE email='john.doe@example.com'),
'Mountain Retreat', 'Cozy cabin in the mountains.', 'Jos, Nigeria', 90.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Seaside Apartment'),
(SELECT user_id FROM User WHERE email='jane.smith@example.com'),
'2025-10-10', '2025-10-15', 750.00, 'confirmed');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE total_price=750.00), 750.00, 'stripe');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Seaside Apartment'),
(SELECT user_id FROM User WHERE email='jane.smith@example.com'),
5, 'Amazing place! Clean, beautiful, and relaxing.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(),
(SELECT user_id FROM User WHERE email='jane.smith@example.com'),
(SELECT user_id FROM User WHERE email='john.doe@example.com'),
'Hello! I’m interested in booking your Seaside Apartment.');
