-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User
ON 
    Booking.user_id = User.user_id;



-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.description,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM 
    Property
LEFT JOIN 
    Review
ON 
    Property.property_id = Review.property_id;



-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

-- == THIS QUERY MAY NOT WORK IN ALL SQL DATABASES AS FULL OUTER JOIN IS NOT SUPPORTED EVERYWHERE ==

-- SELECT
--     User.user_id,
--     CONCAT(User.first_name, ' ', User.last_name) AS full_name,
--     User.email,
--     Booking.booking_id,
--     Booking.property_id,
--     Booking.start_date,
--     Booking.end_date,
--     Booking.total_price,
--     Booking.status
-- FROM
--     User
-- FULL OUTER JOIN
--     Booking
-- ON
--     User.user_id = Booking.user_id;


-- == ALTERNATIVE USING UNION OF LEFT JOIN AND RIGHT JOIN ==

SELECT
    User.user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    User
LEFT JOIN
    Booking
ON
    User.user_id = Booking.user_id

UNION

SELECT
    User.user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    User
RIGHT JOIN
    Booking
ON
    User.user_id = Booking.user_id;

