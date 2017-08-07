/*
KHOA LUONG
KLUON7
1366739
CMPS180 LAB2
*/
SELECT Name, HouseAddress
FROM Persons AS p, Houses AS h, Landlords AS l, Ownerships AS o
WHERE h.ApartmentCount = 1 AND h.HouseID = o.HouseID AND o.LandlordID = l.LandlordID 
AND l.OwnerSSN = p.SSN;
