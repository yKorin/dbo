CREATE TABLE DEVELOPER(
DNAME VARCHAR2 (30) NOT NULL,
LOGIN VARCHAR2 (30) NOT NULL,
EMAIL VARCHAR2 (30) NOT NULL PRIMARY KEY,
AGE INTEGER
);

ALTER TABLE DEVELOPER
  ADD CONSTRAINT check_email
  CHECK (REGEXP_LIKE (EMAIL, '[A-Z0-9._]+@[A-Z0-9._]+\.[A-Z]{2,4}'));
ALTER TABLE DEVELOPER
  ADD CONSTRAINT UNIC_LOGIN UNIQUE (LOGIN);
ALTER TABLE DEVELOPER
  ADD CONSTRAINT CHECK_AGE CHECK (AGE BETWEEN 0 AND 150);