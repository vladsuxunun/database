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



SELECT DISTINCT ON(manufacturer) * FROM products;

SELECT code, manufacturer FROM products LIMIT 3;

SELECT name, price FROM products WHERE price>=200;

SELECT * FROM products WHERE manufacturer=(SELECT code FROM manufacturers WHERE name='Sony');

SELECT name, price FROM products WHERE price<=110 ORDER BY price ASC, manufacturer DESC;

SELECT manufacturer, count(price) FROM products GROUP BY manufacturer;

DELETE FROM manufacturers WHERE code NOT IN (SELECT manufacturer FROM products GROUP BY manufacturer HAVING count(*) >= 1)RETURNING *;

UPDATE products SET price=1.1*price WHERE code=(SELECT code FROM products ORDER BY price ASC LIMIT 1 OFFSET 2) RETURNING name, price;

ALTER TABLE products ALTER COLUMN price SET DEFAULT 0;

INSERT INTO products (name, price, manufacturer) VALUES ('Loudspeakers', DEFAULT, 2);

UPDATE products SET price=0.8*price WHERE manufacturer=(SELECT code FROM manufacturers WHERE name='Fujitsu');

UPDATE products SET price=0.9*price WHERE price>=50 AND price<=200;

