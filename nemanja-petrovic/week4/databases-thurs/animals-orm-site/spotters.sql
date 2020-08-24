
DROP TABLE IF EXISTS spotters;

CREATE TABLE spotters (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  location TEXT,
  animal_id INTEGER --FOREIGN KEY
);

INSERT INTO spotters(name,location,animal_id)
  VALUES('Miko','Sydney',1);

  INSERT INTO spotters(name,location,animal_id)
    VALUES('Okan','Istanbul',2);

    INSERT INTO spotters(name,location,animal_id)
      VALUES('Simo','Belgrade',3);
