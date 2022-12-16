drop procedure if exists PatientCursor;
create procedure PatientCursor()
begin
    declare currPrice int;
    declare totalPrice int;
    declare done int default false;
    declare ProcedureCursor cursor for select Price
                                       from Procedures
                                       where Price > 1000;
    declare continue handler for not found set done = true;
    open ProcedureCursor;
    set done = false;
    set totalPrice = 0;
    cursorLoop:
    loop
        fetch ProcedureCursor into currPrice;
        if done = true then
            leave cursorLoop;
        end if;
        set totalPrice = totalPrice + ifnull(currPrice, 0);
    end loop cursorLoop;

    close ProcedureCursor;
    select totalPrice;
end;
call PatientCursor();
delete
from tmp;
select count(*)
from tmp;

show processlist;
kill 43;