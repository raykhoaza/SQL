BEGIN TRANSACTION;

ALTER TABLE Ownerships
ADD CHECK (PropertyTax >= 0); 

ALTER TABLE Tenants
ADD CONSTRAINT positive_rent CHECK (Rent > 0);

ALTER TABLE Tenants
ADD CHECK ((LeaseExpirationDate IS NULL) OR (LeaseExpirationDate > LeaseStartDate));

ALTER TABLE Tenants
ADD CHECK ((LastRentPaidDate <> CURRENT_DATE) OR (RentOverdue = 'FALSE'));

COMMIT;
