/*
KHOA LUONG
KLUON7
1366739
CMPS180 LAB2
*/
SELECT p1.Name as TenantName, p1.SSN, p1.ApartmentNumber, p1.Salary, h.HouseAddress, p2.Name as LandlordName
FROM Persons as p1, Houses as h, Persons as p2, Ownerships as o, Landlords as l
WHERE p1.SSN IN(SELECT LeaseTenantSSN FROM Tenants WHERE RentOverdue = TRUE)
and p1.HouseID = h.HouseID and h.HouseID = o.HouseID and o.LandlordID = l.LandlordID and l.OwnerSSN = p2.SSN;
