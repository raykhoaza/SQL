BEGIN TRANSACTION;

SELECT p.Name, t.Rent
FROM Home_Landlords h, Tenants t, Persons p
WHERE p.SSN = h.OwnerSSN AND p.SSN = t.LeaseTenantSSN AND t.RentOverdue;

DELETE FROM Tenants
WHERE (HouseID = 1000 OR HouseID = 1100) AND ApartmentNumber = 2;

SELECT p.Name, t.Rent
FROM Home_Landlords h, Tenants t, Persons p
WHERE p.SSN = h.OwnerSSN AND p.SSN = t.LeaseTenantSSN AND t.RentOverdue;

ROLLBACK; 
