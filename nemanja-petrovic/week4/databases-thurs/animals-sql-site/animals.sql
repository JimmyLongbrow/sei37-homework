-- THIS FILE WILL CREATE ANIMALS TABLE AND INSERT ROWS INTO IT.
 DROP TABLE IF EXISTS animals; -- HELPS PREVENT REPEATS
CREATE TABLE animals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  species TEXT,
  description TEXT,
  roundness INTEGER,
  alive BOOLEAN,
  age INTEGER,
  image_url TEXT
);

INSERT INTO animals (name, species, description, roundness, alive, age, image_url)
VALUES(
  'Ruby',
  'Canine',
  'The best dog',
  3,
  1,
  4,
  'https://unsplash.com/photos/mx0DEnfYxic'
);

INSERT INTO animals (name, species, description, roundness, alive, age, image_url)
VALUES(
  'Nemo',
  'Clown Fish',
  'Looking for Nemo',
  5,
  1,
  4,
  'https://unsplash.com/photos/35mIf79_gos'
);

INSERT INTO animals (name, species, description, roundness, alive, age, image_url)
VALUES(
  'Captain Cook',
  'Human',
  'Straya',
  6,
  0,
  400,
  'https://unsplash.com/photos/DszAeHV8zfQ'
);
