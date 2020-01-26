/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select round(sqrt(power(max(LAT_N)-min(LAT_N),2) + power(max(LONG_W)-min(LONG_W),2)), 4) from station ;