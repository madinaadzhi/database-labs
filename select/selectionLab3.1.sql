select *
from Doctor
where SpecialityID = 1;

select *
from Doctor
where Name != 'Borisova Kateryna Yuriivna';

select *
from Doctor
where Qualification = 'Second'
  and PolyclinicID = 3;

select *
from Doctor
where Qualification = 'Second'
   or Qualification = 'Higher';

select *
from Doctor
where not Qualification = 'Higher';

select *
from Doctor
where (SpecialityID > 1 or Qualification = 'First')
  and (SpecialityID >= 2 or Qualification = 'Second');

select *, SpecialityID * PolyclinicID as Multiplication
from Doctor;

select Name, PolyclinicID
from Doctor
where PolyclinicID in (1);

select Name, Price
from Procedures
where Price between 10000 and 25000;

select *
from Patient
where Surname like 'V%';

select Name, Price
from Speciality
where Price is null;

select Name, Price
from Speciality
where Price is not null;