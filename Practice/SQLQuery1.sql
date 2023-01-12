create database myfirstdb

use myfirstdb

create table myfirsttable
(
rollno int,
firstname varchar(59),
lastname varchar(59)
)

use myfirstdb
select * from myfirsttable

insert into myfirsttable(rollno, firstname, lastname)
values (25, 'Guna', 'Vardhan')

select * from myfirsttable


