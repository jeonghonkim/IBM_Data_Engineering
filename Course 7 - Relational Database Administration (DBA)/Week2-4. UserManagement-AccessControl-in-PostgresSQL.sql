-- PostgreSQL CLI

-- 1. Create New Roles and Grant them Relevant Privileges
CREATE ROLE read_only;
GRANT CONNECT ON DATABASE demo TO read_only;
GRANT USAGE ON SCHEMA bookings TO read_only;
GRANT SELECT ON ALL TABLES IN SCHEMA bookings TO read_only;
CREATE ROLE read_write;
GRANT CONNECT ON DATABASE demo TO read_write;
GRANT USAGE ON SCHEMA bookings TO read_write;
GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA bookings TO read_write;

-- 2. Add a New User and Assign them a Relevant Role
CREATE USER user_a WITH PASSWORD 'user_a_password';
GRANT read_only TO user_a;

-- 3. Revoke and Deny Access
REVOKE SELECT ON aircrafts_data FROM user_a;
REVOKE read_only FROM user_a;

-- 4. EXCERCISE 
CREATE USER user_b WITH PASSWORD 'user_b_passwrod';
GRANT read_write TO user_b;
