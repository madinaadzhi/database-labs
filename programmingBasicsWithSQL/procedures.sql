create procedure temporaryTable()
begin
    create temporary table TemporaryTable
    select * from Polyclinic;
    select * from TemporaryTable;
#     drop table if exists TemporaryTable;
end;
call temporaryTable();

create procedure selectWithIf()
begin
    select Name, Address, if(Name = 'Medicom', '+', '-') from Polyclinic;
end;
call selectWithIf();

# Это процедура с использование цикла WHILE и без входных параметров
create procedure whileLoop()
begin
    declare count int default 0;
    while count < 5
        do
            select count;
            set count = count + 1;
        end while;
end;
call whileLoop();

create procedure inputParameter(in name varchar(255), address varchar(255))
begin
    insert into Polyclinic(Name, Address)
    values (name, address);
    select * from Polyclinic;
end;
call inputParameter('HELSA', '29, V. Lobanovskogo Street, Chayki, Kyivska obl.');

create procedure inputAndOutputParameter(in nameIn varchar(255), out nameOut varchar(255))
begin
    select Name
    from Polyclinic
    where Name = nameIn
    into nameOut;
    select nameOut;
end;
call inputAndOutputParameter('HELSA', @nameOut);

create procedure updateTable()
begin
    update Polyclinic
    set Name    = 'Hippocratic',
        Address = '4, Vaclava Gavela Boulevard, Kyiv'
    where PolyclinicID = 6;
end;
call updateTable;

create procedure selectData()
begin
    select *
    from Polyclinic
    where PolyclinicID = 6;
end;
call selectData;
