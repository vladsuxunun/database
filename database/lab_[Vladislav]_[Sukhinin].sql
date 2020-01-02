create DATABASE lab8;
 create table salesman
 (
     salesman_id integer primary key,
     name varchar(50),
      city varchar(50),
     commission NUMERIC




);
create table customers
 (
     customer_id  integer primary key,
     cust_name varchar(50) ,
     city varchar(50),
     grade  integer,

 salesman_id integer references salesman(salesman_id)


);
CREATE TABLE orders(
    ord_no      int primary key ,
    purch_amt   numeric,
    ord_date    date,
    customer_id integer references customers (customer_id),
    salesman_id  integer references salesman (salesman_id)
);
insert into salesman
values (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', null, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);
insert into customers
VALUES(3002,'Nick Rimando','New York',100,5001),
       (3005,'Graham Zusi','California',200,5002),
       (3001,'Brad Guzan','London',NULL,5005),
       (3004,'Fabian Johns','Paris',300,5006),
       (3007,'Brad Davis','New York',200,5001),
       (3009,'Geoff Camero','Berlin',100,5003),
       (3008,'Julian Green','London',300,5002);

   INSERT INTO orders
VALUES (70001,150.5,'2012-10-05',3005,5002),
       (70009,270.65,'2012-09-10',3001,5005),
       (70002,65.26,'2012-10-05',3002,5001),
       (70004,110.5,'2012-08-17',3009,5003),
       (70007,948.5,'2012-09-10',3005,5002),
       (70005,2400.6,'2012-07-27',3007,5001),
       (70008,5760,'2012-09-10',3002,5001);
create role  dev_junior with login password 'qwertyu123456';

CREATE VIEW allorders
AS SELECT name, AVG(purch_amt), SUM(purch_amt)
FROM salesman, orders
WHERE salesman.salesman_id = orders.salesman_id
GROUP BY name;

CREATE VIEW ordercity
AS SELECT city,COUNT(DISTINCT ord_no) AS cnt
FROM customers,orders
WHERE orders.customer_id=customers.customer_id
GROUP BY city;

grant all privileges on ordercity to junior_dev;

CREATE VIEW custlow
as select * from customers
where grade=(SELECT MIN(grade) from customers);

GRANT SELECT ON custlow to junior_dev;

CREATE VIEW salcount AS


    
SELECT COUNT(salesman.salesman_id), grade
FROM customers LEFT JOIN salesman ON customers.salesman_id = salesman.salesman_id
GROUP BY grade;

CREATE VIEW saoreder AS
SELECT * FROM salesman gg
WHERE 1 < (SELECT COUNT(*)
FROM customers cc

WHERE gg.salesman_id = cc.salesman_id);

create role intern with password 'xiaomi_top_za_svoi_dengi';

reassign owned by junior_dev to intern;







