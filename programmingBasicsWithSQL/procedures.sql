create procedure temporaryTable()
begin
    create temporary table TemporaryTable
    select * from Polyclinic;
#     drop table if exists TemporaryTable;
end;
call temporaryTable();
select *
from TemporaryTable;

create procedure selectWithIf()
begin
    select Name, Address, if(Name = 'Medicom', '+', '-') from Polyclinic;
end;
call selectWithIf();

# Это процедура с использование цикла WHILE и без входных параметров
create procedure whileLoop()
begin
    DECLARE n INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
    declare currPrice decimal(10, 2) default 0;
    declare totalPrice decimal(10, 2) default 0;
    SELECT COUNT(*) FROM Speciality INTO n;
    SET i = 0;
    WHILE i < n
        DO
            SELECT Price FROM Speciality LIMIT i,1 into currPrice;
            set totalPrice = totalPrice + ifnull(currPrice, 0);
            SET i = i + 1;
        END WHILE;
    select totalPrice;
end;
call whileLoop();

create procedure inputParameter(in name varchar(255), address varchar(255))
begin
    insert into Polyclinic(Name, Address)
    values (name, address);
end;
call inputParameter('HELSA', '29, V. Lobanovskogo Street, Chayki, Kyivska obl.');
select *
from Polyclinic;

create procedure inputAndOutputParameter(in nameIn varchar(255), out nameOut varchar(255))
begin
    select Name
    from Polyclinic
    where Name = nameIn
    into nameOut;
end;
call inputAndOutputParameter('HELSA', @nameOut);
select @nameOut;

show create procedure updateTable;
create procedure updateTable()
begin
    update Polyclinic
    set Name    = 'Hippocratic',
        Address = '4, Vaclava Gavela Boulevard, Kyiv'
    where PolyclinicID = 9;
end;
call updateTable;
select *
from Polyclinic;

create procedure selectData()
begin
    select *
    from Polyclinic
    where PolyclinicID = 6;
end;
call selectData;

