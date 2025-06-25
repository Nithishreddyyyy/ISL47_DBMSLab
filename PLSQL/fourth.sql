SET SERVEROUTPUT ON;

DECLARE
  CURSOR curr IS SELECT * FROM part1;
  rows part1%ROWTYPE;
  counter INT := 0;
BEGIN
  OPEN curr;
  LOOP
    FETCH curr INTO rows;
    EXIT WHEN curr%NOTFOUND;

    INSERT INTO copy_part1 VALUES (rows.pno, rows.pname, rows.colour);
    counter := counter + 1;
  END LOOP;
  CLOSE curr;

  DBMS_OUTPUT.PUT_LINE(counter || ' rows inserted into the table copy_part1');
END;
/
