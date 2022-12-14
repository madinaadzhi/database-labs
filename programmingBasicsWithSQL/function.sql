create function scalarValue() returns int deterministic
begin
    declare totalPriceSpecialities int;
    select sum(Price) as TotalPriceSpecialities from Speciality
    into totalPriceSpecialities;
    return totalPriceSpecialities;
end;
select scalarValue() as ScalarValue;

create function tableWithDynamicSetColumns()
begin

end;
call tableWithDinamicSetColumns();

create function givenStructureTable()
begin

end;
call givenStructureTable();