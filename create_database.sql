CREATE DATABASE dog_hotels;

USE dog_hotels;

CREATE TABLE owners (
    owner_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) NOT NULL
);

SELECT * 
FROM owners;

CREATE TABLE pets (
    pet_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    breed VARCHAR(50),
    age INT,
    owner_id INT
);

ALTER TABLE pets
ADD CONSTRAINT fk_pets_owners
FOREIGN KEY (owner_ID) REFERENCES owners(owner_id);

SELECT *
FROM pets;

CREATE TABLE hotels (
    hotel_id INT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    capacity INT NOT NULL
);

SELECT *
FROM hotels;

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hotel_id INT
);

ALTER TABLE staff
ADD CONSTRAINT fk_staff_hotels
FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id);

SELECT *
FROM staff;

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    hotel_id INT,
    owner_id INT,
    pet_id INT,
    staff_id INT,
    start_date DATE NOT NULL,
    duration INT NOT NULL
);

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_hotels
FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_owners
FOREIGN KEY (owner_id) REFERENCES owners(owner_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_pets
FOREIGN KEY (pet_id) REFERENCES pets(pet_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_bookings_staff
FOREIGN KEY (staff_id) REFERENCES staff(staff_id);
