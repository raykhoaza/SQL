CREATE VIEW Home_Landlords AS
SELECT l.OwnerSSN, l.LandlordID, h.HouseID, p.ApartmentNumber
FROM Landlords l, Persons p, Houses h, Ownerships o
WHERE l.LandlordAddress = h.HouseAddress AND h.HouseID = o.HouseID AND l.LandlordID = o.LandlordID AND l.OwnerSSN = p.SSN;