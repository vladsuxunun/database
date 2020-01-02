CREATE TABLE manufacturers(
  code SERIAL PRIMARY KEY ,
  name VARCHAR(255)
);

CREATE TABLE products(
  code SERIAL PRIMARY KEY ,
  name VARCHAR(255),
  price NUMERIC,
  manufacturer INTEGER REFERENCES manufacturers
);



SELECT name FROM products;

SELECT name, price FROM products;

SELECT name FROM products WHERE price<=200;

SELECT name, price FROM products WHERE price>=60 AND price<=120;

SELECT name, price FROM products WHERE price>=180 ORDER BY price DESC, name ASC;

SELECT manufacturer, avg(price) FROM products GROUP BY manufacturer;

SELECT manufacturer, avg(price) FROM products GROUP BY manufacturer HAVING avg(price) >= 150;

SELECT name, price FROM products ORDER BY price ASC LIMIT 1;

INSERT INTO products (name, price, manufacturer) VALUES ('Loudspeakers', 70, 2);

UPDATE products SET name='Laser Printer' WHERE code=8;

UPDATE products SET price=0.9*price;

UPDATE products SET price=0.9*price WHERE price>=120;
