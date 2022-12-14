use polyclinic;

alter table Polyclinic
    add column OpeningDay varchar(32) unique;
insert into polyclinic.Polyclinic(Name, OpeningDay)
values ('Madina', 'dnfjdf');
select *
from Polyclinic;
delete
from Polyclinic where PolyclinicID=4;
alter table Polyclinic
    modify column OpeningDay date;
alter table Polyclinic
    drop column OpeningDay;

alter table Speciality
    modify column Price int;

alter table Doctor
    add constraint FkSpecDoctor
        foreign key (SpecialityID) references Speciality (SpecialityID);
alter table Doctor
    drop foreign key FkSpecDoctor;
insert into polyclinic.Doctor(Name, SpecialityID, Qualification, PolyclinicID)
values ('Tepla Olena Valeriivna', 1, 'Higher', 1);

insert into polyclinic.Speciality(Name, Price)
values ('Endocrinologist', null);


