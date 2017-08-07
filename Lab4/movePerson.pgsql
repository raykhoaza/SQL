CREATE OR REPLACE function movePerson (ssn_num integer, house_address varchar(20), ApartmentNum integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
	move_SSN integer;
	move_houseID integer;
	move_aptcount integer;
	move_address varchar(20);
	result integer;
BEGIN
	SELECT p.SSN
	FROM Persons p
	WHERE p.SSN = ssn_num
	INTO move_SSN;

	SELECT h.HouseAddress
	FROM Houses h
	WHERE h.HouseAddress = house_address
	INTO move_address;

	SELECT h.ApartmentCount
	FROM Houses h
	WHERE h.HouseAddress = house_address
	INTO move_aptcount;

	IF move_SSN IS NULL THEN
		result := -1;
	ELSIF move_address IS NULL THEN
		result := -1;
	ELSIF ApartmentNum < 0 THEN
		result := -1;
	ELSIF ApartmentNum > move_aptcount THEN
		result := -1;
	ELSE
		SELECT h.HouseID FROM Houses h WHERE h.HouseAddress = house_address INTO move_houseID;
		
		UPDATE Persons p
		SET HouseID = h.HouseID, ApartmentNumber = ApartmentNum
		FROM Houses h
		WHERE p.SSN = ssn_num AND h.HouseAddress = house_address;
		result := move_HouseID;
	END IF;
	return result;
END $$;
