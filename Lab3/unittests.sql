BEGIN TRANSACTION;
--for 3 HouseID constraints
INSERT INTO Persons
VALUES (123456789, 'Khoa', 4, 4, 4.4);
ROLLBACK; 

INSERT INTO Ownerships
VALUES (12345, 4, CURRENT_DATE, 4.4);
ROLLBACK;

INSERT INTO Tenants
VALUES (4, 4, 459020596, CURRENT_DATE, NULL, 4.4, CURRENT_DATE, 'FALSE');
ROLLBACK;

--4 general constraints 2 unit tests each
--Ownerships PropertyTax
--meet constraint
UPDATE Ownerships
SET PropertyTax = 100.00
WHERE PropertyTax <= 0.00;
ROLLBACK;
--doesn't meet constraint
UPDATE Ownerships
SET PropertyTax = -4.00;
ROLLBACK;
--Tenants Rent
--meet constraint
UPDATE Tenants
SET Rent = 1;
ROLLBACK;
--doesn't meet constraint
UPDATE Tenants
SET Rent = -1;
ROLLBACK;
--Tenants LeaseExpirationDate
--meet constraint
UPDATE Tenants
SET LeaseExpirationDate = LeaseExpirationDate + 5
WHERE LeaseExpirationDate IS NOT NULL;
ROLLBACK;
--doesn't meet constraint
UPDATE Tenants
SET LeaseExpirationDate = LeaseStartDate - 5
WHERE LeaseExpirationDate IS NOT NULL;
ROLLBACK;
--Tenants LastRentPaidDate
--meet constraint
UPDATE Tenants
SET LastRentPaidDate = CURRENT_DATE, RentOverdue = 'FALSE';
ROLLBACK;
--doesn't meet constraint
UPDATE Tenants
SET LastRentPaidDate = CURRENT_DATE, RentOverdue = 'TRUE';
ROLLBACK;


