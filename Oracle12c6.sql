//1
SELECT b.title, p.contact, p.phone 
FROM books b, publisher p 
WHERE b.pubid = p.pubid;

//2
SELECT c.firstname, c.lastname, o.order# 
FROM customers c, orders o 
WHERE c.customer# = o.customer# 
  AND o.shipdate IS NULL 
ORDER BY o.orderdate;

//3
SELECT DISTINCT c.lastname, c.customer# 
FROM books b, orders o, orderitems i, customers c 
WHERE c.customer# = o.customer#  
  AND o.order# = i.order#  
  AND i.isbn = b.isbn  
  AND c.state = 'FL'  
  AND b.category = 'COMPUTER';
  
//4
SELECT DISTINCT c.lastname, c.firstname, b.title
FROM customers c JOIN orders o USING (customer#)
  JOIN orderitems oi USING (order#)
  JOIN books b USING (isbn)
WHERE c.lastname = 'LUCAS' AND c.firstname = 'JAKE';

//5
SELECT c.lastname, c.firstname, b.title, oi.paideach - b.cost profit
FROM customers c JOIN orders o USING (customer#)
  JOIN orderitems oi USING (order#)
  JOIN books b USING (isbn)
WHERE c.lastname = 'LUCAS' AND c.firstname = 'JAKE'
ORDER BY "PROFIT" desc;

//6
SELECT a.lname, b.title
FROM books b JOIN bookauthor ba USING (isbn)
  JOIN author a USING (authorid)
WHERE a.lname = 'ADAMS';

//7
SELECT b.title, p.gift
FROM books b, promotion p
WHERE b.retail BETWEEN p.minretail AND p.maxretail;

//8
SELECT a.lname, a.fname, b.title
FROM customers c JOIN orders o USING (customer#)
  JOIN orderitems oi USING (order#)
  JOIN books b USING (isbn)
  JOIN bookauthor ba USING (isbn)
  JOIN author a USING (authorid)
WHERE c.lastname = 'NELSON' AND c.firstname = 'BECCA';

//9
SELECT b.title, o.order#, c.state
FROM books b, orders o, orderitems oi, customers c
WHERE b.isbn = oi.isbn (+)
  AND oi.order# = o.order# (+)
  AND o.customer# = c.customer# (+);
  
SELECT title, order#, state
FROM books LEFT OUTER JOIN orderitems USING (isbn)
  LEFT OUTER JOIN orders USING (order#)
  LEFT OUTER JOIN customers USING (customer#);
  
//10
//where are managers listed???? 