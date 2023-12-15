-- 1. Restore a Full Database from a Backup
-- \i flights_RUSSIA_small.sql
-- \dt


-- 2. Restore a Full Database from a Backup
-- A) Modify the Database with the CLI
SELECT * FROM aircrafts_data;
INSERT INTO aircrafts_data(aircraft_code, model, range) VALUES (380, '{"en": "Airbus A380-800"}', 15700);
-- B) Backup your Database in pgAdmin


-- 3. Restore a Full Backup after Accidental Deletion
-- A) "Accidentally" Delete the Database in pgAdmin
-- B) Restore the Database using the Full Backup
-- after pgadmin conficuation, enter the following command in the CLI
-- \connect restored_demo
SELECT pg_catalog.set_config('search_path',  'bookings', false);
-- \dt
SELECT * FROM aircrafts_data;


-- 4. Practice Excercisee
-- Scenario: Suppose a passenger, Saniya Koreleva, books a flight with your airline company. 
-- Unfortunately, due to human error her first name was initially entered incorrectly into 
-- the database and you wish to correct it.

-- Task A) Check the original entry for the passenger in the "tickets" table in the restored_demo database.
SELECT * FROM tickets WHERE booking_ref = '0002D8';

-- Task B) Correct the spelling by changing the passenger_name to "SANYA KORELEVA"
UPDATE tickets SET passenger_name = 'SANYA KORELEVA' WHERE booking_ref = '0002D8';

-- Task C) perform a full backup of the restored_demo database.
-- Enter the following command in the Cloud IDE terminal
-- pg_dump --username=postgres --host=localhost restored_demo > restored_demo_backup.sql
