//1
SELECT lastname, firstname, state
FROM customers
WHERE state = 'NJ';

//2
SELECT order#, shipdate
FROM orders
WHERE shipdate > '1-APR-09';

//3
SELECT title, category
FROM books
WHERE category != 'FITNESS';

//4
SELECT customer#, lastname, state
FROM customers
WHERE state IN ('GA','NJ')
ORDER BY lastname;

SELECT customer#, lastname, state
FROM customers
WHERE state = 'GA' OR state = 'NJ'
ORDER BY lastname;

//5
SELECT order#, orderdate
FROM orders
WHERE orderdate <= '1-APR-09';

SELECT order#, orderdate
FROM orders
WHERE orderdate < '2-APR-09';

//6
SELECT lname, fname
FROM author
WHERE lname LIKE '%IN%'
ORDER BY 1, 2;

//7
SELECT lastname, referred
FROM customers
WHERE referred IS NOT NULL;

//8
SELECT title, category
FROM books
WHERE category LIKE 'C%';

SELECT title, category
FROM books
WHERE category >= 'C' AND category < 'D';

SELECT title, category
FROM books
WHERE category BETWEEN 'CHIL' AND 'COOK';

//9
SELECT ISBN, title
FROM books
WHERE title LIKE '_A_N%'
ORDER BY title DESC;

//10
SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate BETWEEN '1-JAN-05' AND '31-DEC-05';

SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate > '31-DEC-04' AND pubdate < '1-JAN-06';

SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate LIKE '%05%';