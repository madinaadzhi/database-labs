create temporary table PatientArchives
(
    PatientArchivesID int not null auto_increment,
    Name              varchar(32),
    Surname           varchar(32),
    MiddleName        varchar(32),
    Birthday          date,
    RegistrationDay   date,
    DeletedTime       datetime default now(),
    primary key (PatientArchivesID)
);
drop table PatientArchives;

insert into Patient(Name, Surname, MiddleName, Birthday, RegistrationDay, CitizenCategoryID)
values ('Vadim', 'Vadimov', 'Vadimovich', '2004-04-05', '2022-12-11', 1);
select *
from Patient;

create trigger deleteData
    before delete
    on Patient
    for each row
begin
    insert into PatientArchives(Name, Surname, MiddleName, Birthday, RegistrationDay)
    values (OLD.Name, OLD.Surname, OLD.MiddleName, OLD.Birthday, OLD.RegistrationDay);
end;

delete
from Patient
where Name = 'Vadim';

select *
from PatientArchives;
select *
from Patient;

create trigger updateData
    before update
    on Doctor
    for each row
begin
    declare errorMessage varchar(255);
    set errorMessage =
            concat('The old value ', OLD.SpecialityID, ' cannot be changed to a new one ', NEW.SpecialityID, '.');
    if NEW.SpecialityID != OLD.SpecialityID then
        signal sqlstate '45000'
            set message_text = errorMessage;
    end if;
end;

update Doctor
set SpecialityID = 2
where DoctorID = 1;

select *
from Doctor;

create trigger insertData
    before insert
    on Treatment
    for each row
begin
    if NEW.VisitDay != curdate() then
        set NEW.VisitDay = curdate();
    end if;
end;

insert into Treatment(VisitDay, PatientID)
values ('2022-12-01', 2);
select *
from Treatment;
