
-- COMMENT
--THIS FILES DEFINES THE STRUCTURE OF THE USERS TABLE AKA SCHEMER

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  email TEXT,
  name TEXT,
  password TEXT,
  profile_image TEXT,
  verified BOOLEAN,
  age INTEGER
);
