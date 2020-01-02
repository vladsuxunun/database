CREATE DATABASE lab1;
 create table user
 (
     id serial primary key,
         firstname varchar (50),
         lastname varchar (50)


);
ALTER TABLE user
ADD column isadmin integer;
ALTER TABLE user
ALTER COLUMN isadmin TYPE boolean using:boolean;
ALTER TABLE user
ALTER COLUMN isadmin SET DEFAULT FALSE;
CREATE TABLE task
(
    id serial,
    name char(50),
    user_id integer
);
DROP TABLE task;
DROP database lab1;
SELECT * FROM task;






