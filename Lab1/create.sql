/*
KHOA LUONG
KLUON7
CMPS180
LAB1
*/
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;

CREATE TABLE Persons(
   SSN             int,
   Name            varchar(30),
   HouseId         int,
   ApartmentNumber int,
   Salary          decimal(7,2)
);

CREATE TABLE Houses(
   HouseID        int,
   HouseAddress   varchar(40),
   ApartmentCount int,
   Color          varchar(40)
);

CREATE TABLE Landlords(
   LandlordID      int,
   OwnerSSN        int,
   LandlordAddress varchar(40)
);

CREATE TABLE Ownerships(
   LandlordID   int,
   HouseID      int,
   PurchaseDate DATE,
   PropertyTax  decimal(7,2)
);

CREATE TABLE Tenants(
   HouseID             int,
   ApartmentNumber     int,
   LeaseTenantSSN      int,
   LeaseStartDate      DATE,
   LeaseExpirationDate DATE,
   Rent                decimal(7,2),
   LastRentPaidDate    DATE,
   RentOverdue         boolean
);
