/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT CEIL(AVG(SALARY - TO_NUMBER(REPLACE(TO_CHAR(SALARY),'0', '')))) FROM EMPLOYEESN