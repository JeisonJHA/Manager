CREATE TABLE SCRIPT (
    FILENAME  VARCHAR(255) NOT NULL,
    UPDATEAT  TIMESTAMP
);
	
ALTER TABLE SCRIPT ADD CONSTRAINT PK_SCRIPT PRIMARY KEY (FILENAME);