CREATE DATABASE lab7;

CREATE TABLE locations(
    location_id serial PRIMARY KEY ,
    street_address varchar(25),
     postal_code varchar(12),
        city varchar(30),
        state_province  varchar(12)

);



CREATE TABLE departments(
    department_id  serial  PRIMARY KEY ,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations

);
create table employees(
employee_id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(20),
salary integer,
manager_id integer references employees,
department_id integer references departments


);
create table  job_grade
(
grade char(1),
lowest_salary integer,
highest_salary integer
);



SELECT first_name, employees.department_id, city, state_province
FROM employees
INNER JOIN departments jj on
    employees.department_id = jj.department_id
INNER JOIN locations l on jj.location_id = l.location_id
WHERE last_name LIKE ('B%') OR last_name LIKE('%b%') OR last_name LIKE('%b');



select department_name, city, state_province FROM departments
    inner join locations l on departments.location_id = l.location_id;




select employees.first_name AS employee_name, g.first_name AS manager_name from employees
left OUTER JOIN employees g on employees.employee_id = g.manager_id;


ALTER TABLE employees
add column grade CHAR(1);

SELECT job_grade.grade,
       AVG(salary) AS averagesalary
FROM job_grade
         INNER JOIN employees mk on job_grade.grade = mk.grade
GROUP BY job_grade.grade;

SELECT first_name, last_name, city
FROM employees inner join departments k on employees.department_id = k.department_id
INNER JOIN locations gg on gg.location_id = gg.location_id
where city = 'London';


SELECT employees.* FROM employees
    INNER JOIN  departments hh on employees.manager_id IS NULL
WHERE employees.department_id =
      (SELECT hh.department_id FROM (
             SELECT COUNT(*) AS dd, department_id FROM employees
                GROUP BY department_id
                ORDER BY dd DESC
                LIMIT 1) AS jhg
       );




SELECT gg.* FROM departments AS gg
INNER JOIN locations ON gg.location_id = locations.location_id
INNER JOIN employees hh on gg.department_id = hh.department_id


where
      hh.salary = (select ((highest_salary + lowest_salary) / 2) AS average FROM job_grade) and locations.city = 'London';



SELECT first_name, last_name, job_grade.grade
FROM employees
    AS ll

    inner JOIN job_grade ON ll.grade = job_grade.grade
    INNER JOIN departments ss on ll.department_id = ss.department_id

where ll.department_id in (


    select ss.department_id from departments


        where ss.budget>  (SELECT AVG(budget) AS average from departments)
    );







