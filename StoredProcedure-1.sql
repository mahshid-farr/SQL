 SET   SERVEROUTPUT ON
<<big>>
DECLARE
      v_mine  NUMBER(4) := 500;
BEGIN
  	<<small>>
  	DECLARE
      		v_mine  NUMBER(3) := 700;
  	BEGIN
      		dbms_output.put_line('Local V_MINE is here: ' || v_mine);
     		dbms_output.put_line('Outer V_MINE is here: ' || big.v_mine);     
      		big.v_mine := v_mine * 2;
  	END;
      dbms_output.put_line('Outer V_MINE is here: ' || v_mine);
END;




 DECLARE
    message VARCHAR2(50);
    num1 NUMBER(8,2);
    myConst CONSTANT VARCHAR2(4) := '704B';
    myBoolean BOOLEAN;
    myDate DATE := CURRENT_DATE + 7;
    BEGIN
       --message := 'C++ advanced';
     dbms_output.put_line('my constant variable: ' || myConst);
     dbms_output.put_line('next week is: ' || myDate);
 
 
 
   IF (message LIKE '%SQL%') THEN
   dbms_output.put_line('The name of the course is : ' || message);
 
 
   ELSIF(myConst = '704B') THEN
   IF message IS NOT NULL THEN
   dbms_output.put_line('The name of the course is : ' || message || ' and room number is : ' || myConst);
   ELSE
   dbms_output.put_line('Course is unknown, but room number is : ' || myConst);
   END IF;
   ELSE
   dbms_output.put_line('Course and location could not be determined');
   END IF;
   END;
   
--when varchar2 variable message is null

my constant variable: 704B
next week is: 09-APR-20
Course is unknown, but room number is : 704B




 DECLARE
    message VARCHAR2(50);
    num1 NUMBER(6,2);
    myConst CONSTANT VARCHAR2(4) := '704B';
    myBoolean BOOLEAN;
    myDate DATE := CURRENT_DATE + 7;
    BEGIN
       message := 'C++ advanced';
    dbms_output.put_line('my constant variable: ' || myConst);
   dbms_output.put_line('next week is: ' || myDate);
 
 
 
   IF (message LIKE '%SQL%') THEN
   dbms_output.put_line('The name of the course is : ' || message);
 
 
   ELSIF(myConst = '704B') THEN
   IF message IS NOT NULL THEN
   dbms_output.put_line('The name of the course is : ' || message || ' and room number is : ' || myConst);
   ELSE
   dbms_output.put_line('Course is unknown, but room number is : ' || myConst);
   END IF;
   ELSE
   dbms_output.put_line('Course and location could not be determined');
   END IF;
   END;
  
-- when varchar2 variable message is set to'C++ advanced'

my constant variable: 704B
next week is: 09-APR-20
The name of the course is : C++ advanced and room number is : 704B





CREATE TABLE Lab8_tab (
Id NUMBER(6),
LName VARCHAR2(20)
);

Table created.

CREATE SEQUENCE Lab1_seq
  START WITH     1
  INCREMENT BY   5
  NOCACHE
  NOCYCLE;



DECLARE 
	v_id lab8_tab.id%type;
   	v_lname lab8_tab.lname%type;
BEGIN
	-- v_id := lab1_seq.NEXTVAL;
	
	BEGIN
	SELECT last_name INTO v_lname
	FROM student
	WHERE student_id IN (SELECT student_id
                     FROM enrollment
                     GROUP by student_id
                     HAVING COUNT(*)=(SELECT MAX(count(*))
                                      FROM enrollment
                                      GROUP BY student_id))
	AND LENGTH(last_name) <9;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No student found');
	
		WHEN TOO_MANY_ROWS THEN
		v_lname := 'Multiple names';
		DBMS_OUTPUT.PUT_LINE('Multiple names');
	END;

INSERT INTO lab8_tab
(id, lname)
VALUES
(lab1_seq.NEXTVAL, v_lname);

	BEGIN
	SELECT last_name INTO v_lname
	FROM student
	WHERE student_id IN (SELECT student_id
                     FROM enrollment
                     GROUP by student_id
                     HAVING COUNT(*)=(SELECT MIN(count(*))
                                      FROM enrollment
                                      GROUP BY student_id));
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No student found');
	
		WHEN TOO_MANY_ROWS THEN
		v_lname := 'Multiple Names';
		DBMS_OUTPUT.PUT_LINE('Multiple names in result');
	END;

INSERT INTO lab8_tab
(id, lname)
VALUES
(lab1_seq.NEXTVAL, v_lname);


	BEGIN
	SELECT last_name INTO v_lname
	FROM instructor
	WHERE instructor_id IN (SELECT instructor_id
                     FROM section
                     GROUP by instructor_id
                     HAVING COUNT(*)=(SELECT MIN(count(*))
                                      FROM section
                                      GROUP BY instructor_id))
	AND last_name NOT LIKE '%s';
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No student found');
	
		WHEN TOO_MANY_ROWS THEN
		v_lname := 'Multiple Names';
		DBMS_OUTPUT.PUT_LINE('Multiple names in result');
	END;

INSERT INTO lab8_tab
(id, lname)
VALUES
(2, v_lname); -- assuming 'first variable' means you choose your own number, in that case I choose 2

	BEGIN
	SELECT last_name INTO v_lname
	FROM instructor
	WHERE instructor_id IN (SELECT instructor_id
                     FROM section
                     GROUP by instructor_id
                     HAVING COUNT(*)=(SELECT MAX(count(*))
                                      FROM section
                                      GROUP BY instructor_id));
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No student found');
	
		WHEN TOO_MANY_ROWS THEN
		v_lname := 'Multiple Names';
		DBMS_OUTPUT.PUT_LINE('Multiple names in result');
	END;

INSERT INTO lab8_tab
(id, lname)
VALUES
(lab1_seq.NEXTVAL, v_lname);

END;



