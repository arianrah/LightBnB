DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS rates;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS guest_reviews;
DROP TABLE IF EXISTS property_reviews;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(75),
  password VARCHAR(50),
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER REFERENCES users(id),
  title VARCHAR(50),
  description TEXT(300),
  thumbnail_photo_url VARCHAR(200),
  cover_photo_url VARCHAR(200),
  cost_per_night VARCHAR(200),
  street VARCHAR(50),
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(50),
  city VARCHAR(50),
  province VARCHAR(50),
  post_code VARCHAR(50),
  active BOOLEAN
);

CREATE TABLE rates (
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  cost_per_night INTEGER,
  property_id INTEGER REFERENCES property_reviews(property_id)
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE,
  property_id INTEGER,
  guest_id INTEGER
);

CREATE TABLE guest_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER,
  owner_id INTEGER,
  reservation_id INTEGER,
  rating INTEGER,
  message VARCHAR(250),
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER,
  reservation_id INTEGER,
  property_id INTEGER,
  rating INTEGER,
  message VARCHAR(250)
);