## **Running PL/SQL Script in Oracle 19c from Terminal**

---

### Step 1: Create the PL/SQL Script

Open terminal and type:

```bash
gedit p1.sql

```

Paste the following PL/SQL code into the editor:

```sql
SET SERVEROUTPUT ON;

BEGIN
    UPDATE employee1
    SET salary = salary * 1.15
    WHERE deptno = 10;

    DBMS_OUTPUT.PUT_LINE('Number of rows updated are: ' || SQL%ROWCOUNT);
END;
/

```

*Save and close the file.*

---

### Step 2: Open SQL*Plus

In terminal, connect using:

```bash
sp
```

---

### Step 3: Run the Script

Once you're inside the SQL prompt, execute:

```sql
@p1.sql

```

---

### Example Output

If 3 rows are updated:

```
Number of rows updated are: 3

```

---

<aside>
💡

### Notes

- Ensure the `employee1` table exists with `salary` and `deptno` columns.
- `SET SERVEROUTPUT ON;` is necessary to see output from `DBMS_OUTPUT.PUT_LINE`.
</aside>

---

**✍️ Author: Nithish Reddy**
