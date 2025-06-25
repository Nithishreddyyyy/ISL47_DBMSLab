SET SERVEROUTPUT ON;

DECLARE
    n NUMBER := &n;  -- User input at runtime
    j NUMBER := 2;
    counter NUMBER := 0;
BEGIN
    IF n <= 1 THEN
        DBMS_OUTPUT.PUT_LINE(n || ' is not a prime number');
    ELSE
        WHILE j <= n / 2 LOOP
            IF MOD(n, j) = 0 THEN
                DBMS_OUTPUT.PUT_LINE(n || ' is not a prime number');
                counter := 1;
                EXIT;
            ELSE
                j := j + 1;
            END IF;
        END LOOP;

        IF counter = 0 THEN
            DBMS_OUTPUT.PUT_LINE(n || ' is a prime number');
        END IF;
    END IF;
END;
/
