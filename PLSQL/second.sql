-- STEP 1: Create the original Shipment table
CREATE TABLE Shipment (
  SID VARCHAR2(10),
  PID VARCHAR2(10),
  Quantity NUMBER
);

-- STEP 2: Insert sample data
INSERT INTO Shipment VALUES ('S1', 'P100', 50);
INSERT INTO Shipment VALUES ('S2', 'P101', 30);
INSERT INTO Shipment VALUES ('S3', 'P100', 40);
COMMIT;

-- STEP 3: Create the backup table
CREATE TABLE Shipment_Copy (
  SID VARCHAR2(10),
  PID VARCHAR2(10),
  Quantity NUMBER
);

-- STEP 4: PL/SQL block to copy entries for a specific part
DECLARE
  v_part_id VARCHAR2(10) := 'P100';  -- #PID to filter
BEGIN
  INSERT INTO Shipment_Copy (SID, PID, Quantity)
  SELECT SID, PID, Quantity
  FROM Shipment
  WHERE PID = v_part_id;

  DBMS_OUTPUT.PUT_LINE('Rows copied for Part ID: ' || v_part_id);
END;
/

select * from Shipment_Copy;
