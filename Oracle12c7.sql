--1
SELECT title, retail
FROM books
WHERE retail < (SELECT AVG(retail)
                FROM books);
                
--2
SELECT title, cost, category, average
FROM books JOIN (SELECT category, AVG(cost) average
                   FROM books
                   GROUP BY category)
           USING(category)
WHERE cost < average;

SELECT a.title, b.category, a.cost FROM books a, (SELECT category, AVG(cost) averagecost FROM books GROUP BY category) b WHERE a.category = b.category AND a.cost < b.averagecost;


--3
SELECT order#, shipstate
FROM orders
WHERE shipstate = (SELECT shipstate
                  FROM orders
                  WHERE order# = '1014');

--4
SELECT order#, SUM(paideach*quantity)
FROM orderitems
Group BY order#
Having SUM( paideach * quantity) > (SELECT SUM(paideach*quantity)
                                    FROM orderitems
                                   WHERE order# = '1008');
                                   
                                   
                  
--5
SELECT lname, fname, isbn
FROM bookauthor JOIN author USING(authorid)
WHERE isbn IN (SELECT isbn
                FROM orderitems
                GROUP BY isbn
                HAVING SUM(quantity) = (SELECT MAX (COUNT(*))
                                        FROM orderitems
                                        GROUP BY isbn));
                                        
--6
SELECT title, category
FROM books 
WHERE category IN (SELECT category
                  FROM books JOIN orderitems USING(isbn)
                  JOIN orders USING (order#)
                  WHERE customer# = '1007')
AND isbn NOT IN (SELECT isbn 
                  FROM orders JOIN orderitems USING (order#)
                  WHERE customer# = 1007);
--7
SELECT shipcity, shipstate, (shipdate - orderdate) delay
FROM orders
WHERE (shipdate - orderdate) = (SELECT MAX(shipdate-orderdate)
                                FROM orders);
                                
--8
SELECT firstname, lastname, title
FROM customers JOIN orders USING(customer#)
JOIN orderitems USING(order#)
JOIN books USING (isbn)
WHERE retail = (SELECT MIN(retail)
                FROM books);
                
--9
SELECT COUNT(DISTINCT customer#)
FROM orders JOIN orderitems USING(order#)
JOIN books USING (isbn)
JOIN bookauthor USING (isbn)
JOIN author USING (authorid)
WHERE lname = 'AUSTIN' AND fname = 'JAMES';

--or
SELECT COUNT(DISTINCT customer#) 
FROM orders JOIN orderitems USING (order#) 
WHERE isbn IN (SELECT isbn
               FROM orderitems JOIN bookauthor USING (isbn) 
               JOIN author USING (authorid) 
               WHERE lname = 'AUSTIN' AND fname = 'JAMES');

--10
SELECT title 
FROM books 
WHERE pubid = (SELECT pubid 
               FROM books 
               WHERE title = 'THE WOK WAY TO COOK');





