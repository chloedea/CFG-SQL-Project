USE dog_hotels;

-- Core Requirements

-- 3. Using any type of the joins create a view that combines multiple tables in a logical way
-- I created a view to see all staff and the locations in which they work
-- I used a LEFT JOIN here as I wanted to see all staff, including ones without a hotel assigned e.g. Bradley Shark 


CREATE VIEW staff_locations AS
SELECT
	s.first_name AS first_name,
	s.last_name AS last_name,
	h.city AS location
FROM staff AS s
LEFT JOIN hotels AS h ON s.hotel_id = h.hotel_id;
    
SELECT *
FROM staff_locations
ORDER BY location;

-- 4. In your database, create a stored function that can be applied to a query in your DB
-- I created a function to give the dog's full name, i.e. the pet's first name and the last name of its owner using CONCAT

DELIMITER //

CREATE FUNCTION dog_full_name(pet_id INT) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE dog_full_name VARCHAR(200);
    SELECT CONCAT(p.name, ' ', o.last_name) INTO dog_full_name
    FROM pets AS p
    INNER JOIN owners AS o ON p.owner_id = o.owner_id
    WHERE p.pet_id = pet_id;
    RETURN dog_full_name;
END 

//

DELIMITER ;

-- Used in a query to return the full name of dogs age 11+ to create a special name card for senior dogs

SELECT dog_full_name(pet_id) AS senior_full_names
FROM pets
WHERE age >= 11;

-- 5. Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- I created a query with a subquery to find all of the owners with more than one pet to send a targeted email 
-- with a special offer for multiple pets

SELECT o.first_name, o.last_name, o.email
FROM owners o 
WHERE o.owner_id IN (
	SELECT p.owner_id
    FROM pets p
    GROUP BY p.owner_id
    HAVING COUNT(p.pet_id) > 1
);

-- Advanced Requirements 

-- 1. In your database, create a stored procedure and demonstrate how it runs

-- I created a stored procedure that can be used to see how many bookings each hotel has, this can be used to see 
-- which hotel (city) is performing best for reporting i.e., Manchester and London both have 6 bookings

DELIMITER //

CREATE PROCEDURE total_bookings_by_hotel()
BEGIN
    SELECT b.hotel_id, h.city, COUNT(b.booking_id) AS booking_count
    FROM Bookings AS b
    INNER JOIN Hotels AS h ON b.hotel_id = h.hotel_id
    GROUP BY b.hotel_id, h.city
    ORDER BY booking_count DESC;
END //

DELIMITER ;

CALL total_bookings_by_hotel();

-- 4. Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a 
-- logically arranged result set for analysis.

-- I created a view to show the number of bookings in each hotel grouped by breed

CREATE VIEW hotel_bookings_by_breed AS
SELECT 
    h.hotel_id,
    h.city,
    p.breed,
    COUNT(b.booking_id) AS number_of_bookings
FROM 
    hotels AS h
INNER JOIN 
    bookings AS b ON h.hotel_id = b.hotel_id
INNER JOIN 
    pets AS p ON b.pet_id = p.pet_id
GROUP BY 
    hotel_id, h.city, p.breed;

-- I created a query to show the most popular breed booked into the hotel in London, ordered by popularity, e.g. French Bulldog 
-- to see if they can do any breed specific incentives 

SELECT city, breed, number_of_bookings AS number
FROM hotel_bookings_by_breed
WHERE city = 'London'
ORDER BY number DESC;
