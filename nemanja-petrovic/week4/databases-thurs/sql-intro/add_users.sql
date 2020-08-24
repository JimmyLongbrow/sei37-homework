-- TO ADD ROWS TO A TABLE USE INSERT INTO
INSERT INTO users (id,email,name,password,profile_image,verified,age)
VALUES(
  1,
  'luke@ga.co',
  'Luke',
  'chicken',
  'http://www.fillmurray.com/200/300',
  1, -- means true
  12
);

INSERT INTO users (id,email,name,password,profile_image,verified,age)
VALUES(
  2,
  'zara@ga.co',
  'Zara',
  'chicken',
  'http://www.fillmurray.com/200/300',
  1, -- means true
  13
);

INSERT INTO users (id,email,name,password,profile_image,verified,age)
VALUES(
  3,
  'ben@ga.co',
  'Ben',
  'chicken',
  'http://www.fillmurray.com/200/300',
  0, -- means true
  13
);
