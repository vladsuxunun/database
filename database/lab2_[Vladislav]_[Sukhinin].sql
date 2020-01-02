create database todolist;
create table schedule
(
     id serial,

      name varchar(50),

     start_datetime timestamp,
     end_datetime timestamp,
     is_finished boolean,
     description varchar


);
ALTER TABLE schedule
ADD ROW created_at timestamp;

ALTER TABLE schedule
ALTER COLUMN name  SET DATA TYPE varchar(100);

ALTER TABLE schedule
ALTER COLUMN   SET is_finished DEFAULT false;



ALTER TABLE schedule
    ADD PRIMARY KEY(id);

create table tasks
(
    id SERIAL,
    name varchar(50),
    description char,
    priority smallint,
    project_id   SERIAL REFERENCES schedule(id)


);
DROP TABLE schedule RESTRICT;
DROP TABLE schedule CASCADE ;

DROP DATABASE todolist;







