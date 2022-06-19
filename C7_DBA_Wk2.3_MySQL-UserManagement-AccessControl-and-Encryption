-- MySQL CLI
SET @key_str = SHA2('My secret passphrase', 512);
USE world;
SELECT * FROM countrylanguage LIMIT 5;
ALTER TABLE countrylanguage MODIFY COLUMN Percentage varbinary(255);
UPDATE countrylanguage SET Percentage = AES_ENCRYPT(Percentage, @key_str);
SELECT * FROM countrylanguage LIMIT 5;
SELECT cast(AES_DECRYPT(Percentage, @key_str) as char(255)) FROM country_language;
