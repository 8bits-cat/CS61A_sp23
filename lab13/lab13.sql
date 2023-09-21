.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students
  WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students
  WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students
  GROUP BY smallest HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students AS a, students AS b
  WHERE a.time < b.time AND a.pet = b.pet AND a.song = b.song;


CREATE TABLE sevens AS
  SELECT s.seven FROM students AS s, numbers AS n
  WHERE s.time = n.time and s.number = 7 AND n.'7' = 'True' ;


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products
  GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, price FROM inventory
  GROUP BY item HAVING MIN(price);


CREATE TABLE shopping_list AS
  SELECT item, store FROM lowest_prices, (SELECT name, MSRP / rating AS cost FROM products
					 GROUP BY category HAVING MIN(MSRP / rating))
  WHERE item = name;


CREATE TABLE total_bandwidth AS
  SELECT SUM(Mbs) FROM stores, shopping_list
  WHERE stores.store = shopping_list.store;

