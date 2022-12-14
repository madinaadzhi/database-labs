create procedure PatientCursor()
begin
    declare name, surname, middleName varchar(32);
    declare done int default 0;
    declare PatientCursor cursor for select Name, Surname, MiddleName
                                     from Patient;
    declare continue handler for not found set done = 1;
    open PatientCursor;
    `loop`:
    loop
        fetch PatientCursor into name, surname, middleName;
        if done = 1 then
            leave `loop`;
        end if;
        select name, surname, middleName;
    end loop;
#     close PatientCursor;
end;
call PatientCursor();
