create function totalPrice()
    returns decimal(10, 2)
    DETERMINISTIC NO SQL
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
    return totalPrice;
end;
select 12 * totalPrice() as YearlyBudget;

# create function tableWithDynamicSetColumns()
# begin
-- https://dev.mysql.com/doc/refman/5.7/en/create-function-loadable.html
# end;
# call tableWithDinamicSetColumns();

# create function givenStructureTable()
# begin
-- https://dev.mysql.com/doc/refman/5.7/en/create-function-loadable.html
# end;
# call givenStructureTable();