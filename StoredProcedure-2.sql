 SET SERVEROUTPUT ON;
 SET VERIFY OFF;

edit
Wrote file afiedt.buf

    DECLARE	
    TYPE course_table_type IS TABLE OF
    COURSE.DESCRIPTION%TYPE 
    INDEX BY BINARY_INTEGER;
    course_table course_table_type;
    v_count NUMBER(5) := 1;
    CURSOR c_course_cursor IS 
    Select DESCRIPTION from course 
    where PREREQUISITE IS NULL 
   ORDER BY DESCRIPTION;
   BEGIN
   	OPEN c_course_cursor;
   	LOOP
   	FETCH c_course_cursor INTO course_table(v_count);
   	EXIT WHEN c_course_cursor%NOTFOUND;
   	DBMS_OUTPUT.PUT_LINE('Course Description : ' || v_count || ':' || course_table(v_count));
   	v_count := v_count + 1;
   	END LOOP;
   	v_count := v_count - 1;
   	DBMS_OUTPUT.PUT_LINE('Total # of Courses' || ' without the Prerequisite is: ' || v_count);
   	DBMS_OUTPUT.PUT_LINE('***********************************************');
   	CLOSE c_course_cursor;
  END;

                                                             

edit
Wrote file afiedt.buf

    DECLARE	
    TYPE course_table_type IS TABLE OF
    COURSE%ROWTYPE;
    course_table course_table_type := course_table_type();
    v_count NUMBER(5) := 1;
    CURSOR c_course_cursor IS 
    select DESCRIPTION from course 
    where PREREQUISITE IS NULL 
    ORDER BY DESCRIPTION;
   BEGIN
   	FOR i IN c_course_cursor
   	LOOP
   	course_table.EXTEND;
   	DBMS_OUTPUT.PUT_LINE('Course Description : ' || v_count || ': ' || i.description);
   	v_count := v_count + 1;
   	END LOOP;
   	v_count := v_count - 1;
   	DBMS_OUTPUT.PUT_LINE('Total # of Courses' || ' without the Prerequisite is: ' || v_count);
   	DBMS_OUTPUT.PUT_LINE('***********************************************');
  END;

                               
edit
Wrote file afiedt.buf

    DECLARE
    type t_rec is RECORD
    ( 
    v_zip NUMBER,
    v_num_stud NUMBER
    );
    v_total NUMBER := 0;
    v_total_students NUMBER;
    t_course t_rec;
   CURSOR c_zip IS Select ZIP, COUNT(STUDENT_ID) 
   FROM (SELECT DISTINCT s.zip, s.student_id
                from Student s LEFT JOIN enrollment e
                ON s.student_id = e.student_id 
                WHERE s.zip LIKE '&zip' || '%')
   GROUP BY zip
   ORDER BY zip;
   BEGIN
   	SELECT COUNT(*) INTO v_total_students 	
   	FROM student where zip LIKE '&zip'|| '%';
   	IF(v_total_students > 0) THEN
   	OPEN c_zip;
   	LOOP
   	FETCH c_zip INTO t_course;
   	EXIT WHEN c_zip%NOTFOUND;
   	DBMS_OUTPUT.PUT_LINE('Zip code: ' || t_course.v_zip || ' has exactly ' || t_course.v_num_stud || ' students enrolled.');
   	v_total := v_total + 1;
   	END LOOP;
   	DBMS_OUTPUT.PUT_LINE('***************************************************');
   	DBMS_OUTPUT.PUT_LINE('Total # of zip codes under ' || '&zip' || ' is ' || v_total);
   	DBMS_OUTPUT.PUT_LINE('Total # of Students under zip code ' || '&zip' || ' is ' || v_total_students);
   	CLOSE c_zip;
   	ELSE
   	DBMS_OUTPUT.PUT_LINE('&zip'  ||  'This zip area is student empty. Please, try again');
   	END IF;
  END;


edit
Wrote file afiedt.buf

    DECLARE
    CURSOR c_zip IS Select ZIP, COUNT(STUDENT_ID) AS stud_total
    FROM (SELECT DISTINCT s.zip, s.student_id 
    from Student s LEFT JOIN enrollment e
    ON s.student_id = e.student_id 
    WHERE s.zip LIKE '&zip' || '%')
    GROUP BY zip
    ORDER BY zip;
    c_stud c_zip%ROWTYPE;
   TYPE zip_table_type IS TABLE OF
   c_stud%TYPE INDEX BY PLS_INTEGER;
   zip_table zip_table_type;
   v_total NUMBER := 0;
   v_total_students NUMBER;
   BEGIN
   	SELECT COUNT(*) INTO v_total_students FROM student where zip LIKE '&zip'|| '%';
   	IF(v_total_students > 0) THEN
   	FOR i in c_zip
   	LOOP
   	DBMS_OUTPUT.PUT_LINE('Zip code: ' || i.zip || ' has exactly ' || i.stud_total || ' students enrolled.');
   	v_total := v_total + 1;
   	END LOOP;
   	DBMS_OUTPUT.PUT_LINE('***************************************************');
   	DBMS_OUTPUT.PUT_LINE('Total # of zip codes under ' || '&zip' || ' is ' || v_total);
   	DBMS_OUTPUT.PUT_LINE('Total # of Students under zip code ' || '&zip' || ' is ' || v_total_students);
   	ELSE
   	DBMS_OUTPUT.PUT_LINE('&zip'  ||  ' This zip area is student empty. Please, try again');
   	END IF;
  END;

 spool off;

