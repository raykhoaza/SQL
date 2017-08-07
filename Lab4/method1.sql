SELECT LeaseTenantSSN
FROM Tenants 
GROUP BY LeaseTenantSSN 
HAVING count(HouseID)>=4;
