-- migrate:up
CREATE TABLE
  pilot (id INTEGER PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE
  aircraft (
    id INTEGER PRIMARY KEY,
    registration TEXT NOT NULL,
    plane_model_id INTEGER NOT NULL,
    FOREIGN KEY (plane_model_id) REFERENCES plane_model (id)
  );

CREATE TABLE
  aircraft_model (id INTEGER PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE
  logbook (
    id INTEGER PRIMARY KEY,
    date TEXT NOT NULL,
    aircraft_id INTEGER,
    FOREIGN KEY (aircraft_id) REFERENCES aircraft (id),
    command_pilot_id INTEGER,
    FOREIGN KEY (command_pilot_id) REFERENCES pilot (id),
    co_pilot_id INTEGER,
    FOREIGN KEY (co_pilot_id) REFERENCES pilot (id),
    description TEXT NOT NULL,
    hours REAL NOT NULL,
  );

-- migrate:down
DROP TABLE pilot;

DROP TABLE aircraft;

DROP TABLE aircraft_model;

DROP TABLE logbook;
