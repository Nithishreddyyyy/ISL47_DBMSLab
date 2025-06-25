SET SERVEROUTPUT ON;

DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
    n NUMBER;
    i NUMBER; 
BEGIN
    n := 8;       -- Number of terms in the Fibonacci series
    a := 0;
    b := 1;

    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(b);

    FOR i IN 1..n-2 LOOP
        c := a + b;
        DBMS_OUTPUT.PUT_LINE(c);
        a := b;
        b := c;
    END LOOP;
END;
/
