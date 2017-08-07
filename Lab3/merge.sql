BEGIN TRANSACTION;

UPDATE Tenants t
SET LastRentPaidDate = n.Datepaid, RentOverdue = 'FALSE'
FROM NewRentPayments n
WHERE t.LeaseTenantSSN = n.LeaseTenantSSN AND t.Rent = n.Rent 
AND t.HouseID = n.HouseID AND t.ApartmentNumber = n.ApartmentNumber;

INSERT INTO Tenants (HouseID, ApartmentNumber, LeaseTenantSSN, LeaseStartDate, LeaseExpirationDate,
Rent, LastRentPaidDate, RentOverdue)
SELECT n.HouseID, n.ApartmentNumber, n.LeaseTenantSSN, CURRENT_DATE, NULL, n.Rent, n.Datepaid, 'FALSE'
FROM NewRentPayments n
WHERE (n.HouseID, n.ApartmentNumber) NOT IN (SELECT t.HouseID, t.ApartmentNumber FROM Tenants t);

COMMIT;
