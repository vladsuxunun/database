create DATABASE lab3;
 create table countries
 (
     country_id serial primary key,
     country_name varchar,
     region_id integer,
     capital_name varchar,
            population  integer



);

   insert into countries(region_id,capital_name,country_name)
values(NULL,'Astana','Britain');
insert into countries(region_id)
values(NULL);
alter table countries
alter column country_name set  default 'Kazakhastan';
alter table countries
alter column  capital_name set default 'Nursultan';
insert into countries(country_id,region_id,capital_name,country_name)
values(DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT);

create table countries_new(like countries);
select * from countries_new;

insert into countries_new select* from countries
WHERE (country_name like 'K%' AND population<10000);

update countries_new  set region_id=1 where region_id is null;
update countries_new  set population=50 where country_name='Kazakhstan';
select country_name, population*1.15 as newPopulation
       from countries_new;

update countries_new set population=100001 where region_id=875 ;

DELETE FROM countries_new
WHERE (country_name like 'K%' AND population<10000);

DELETE FROM countries_new
using countries
WHERE countries_new.country_id = countries.country_id
returning*;

DELETE FROM countries
returning*






