/*
KHOA LUONG
KLUON7
1366739
CMPS180 LAB2
*/
SELECT name 
FROM Persons as p, Tenants as t
WHERE p.ApartmentNumber = t.ApartmentNumber and p.HouseID = t.HouseID
and t.Rent > p.Salary/2;  
