/*
KHOA LUONG
KLUON7
1366739
CMPS180 LAB2
*/
SELECT Color, ApartmentCount
FROM Persons as p, Houses as h
WHERE p.Name = 'John Smith' and p.houseID = h.HouseID
GROUP BY Color, ApartmentCount;
