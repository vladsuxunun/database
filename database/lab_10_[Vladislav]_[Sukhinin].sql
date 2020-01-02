create table accounts(
    id serial primary key ,
    name varchar(50),
    age int,
    balance int
);

insert into accounts(name, age, balance) values('Anna', 35, 32000),
                                                ('Nurlam', 25, 45000),
                                                ('Adam', 21, 35000),
                                                ('Mishel', 19, 65000),
                                                ('Dana', 27, 75000),
                                                ('Kirill', 22, 95000),
                                                ('Janiek', 24, 37000);

begin;
update accounts set balance = balance+1000 where id = 1;
update accounts set balance = balance-20000 where id = 2;
update accounts set balance=balance-3000 where id = 3;
rollback;

begin;
update accounts set balance = balance - 1500 where name = 'Kirill';
update accounts set balance = balance + 1500 where name = 'Adam';
rollback;
commit;

begin;
delete from accounts where name = 'Dana';
rollback;
update accounts set balance = 70000 where name = 'Dana';
commit;

begin;
update accounts set balance = balance-3000 where id = 3;
update accounts set balance = balance+1000 where id = 1;
update accounts set balance = balance+1000 where id = 2;
rollback;
commit;

--The changes of the User_2 will take place after the changes of the User_1 made, because User_1 made changes through transaction
--If User_1 does not commit the changes will not be seen by User_2
--If User_1 does ROLLBACK then User_2 will not see any changes, because User_1 canceled
--If User_1 does COMMIT then User_2 will see all changes made by User_1 during the transaction


