/*
KHOA LUONG
KLUON7
1366739
CMPS180 LAB2
*/
select DISTINCT Name
from Persons as p, Houses as h
where h.HouseAddress = '1730 Alma Street' and h.HouseID = p.HouseID;  
