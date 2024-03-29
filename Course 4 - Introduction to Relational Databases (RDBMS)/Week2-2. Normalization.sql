-- Week 2.2 Normalization, Keys and Constraints in Relational Database

-- EXCERCISE 1. NORMALIZATION

-- 1. Create BookShop_AuthorDetails
CREATE TABLE BookShop_AuthorDetails
AS 
(SELECT DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop)
WITH DATA;
SELECT * FROM BookShop_AuthorDetails;

-- 2. Drop the redundant author information
ALTER TABLE BookShop
DROP COLUMN AUTHOR_NAME
DROP COLUMN AUTHOR_BIO;
SELECT * FROM BookShop;

-- 3. Ensure the tables in 2NF
SELECT * FROM BookShop;
SELECT * FROM BookShop_AuthorDetails;



-- EXCERCISSE 2. KEYS 

-- 1. Primary Keys 
Call Sysproc.admin_cmd ('reorg Table BookShop');
ALTER TABLE BookShop
ADD PRIMARY KEY (BOOK_ID);
ALTER TABLE BookShop_AuthorDetails
ADD PRIMARY KEY (AUTHOR_ID);

-- 2. Foreign Key 
ALTER TABLE BookShop
ADD CONSTRAINT fk_BookShop FOREIGN KEY (AUTHOR_ID)
	REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
	ON UPDATE NO ACTION 
	ON DELETE NO ACTION;



