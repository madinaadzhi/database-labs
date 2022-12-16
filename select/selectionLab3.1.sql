select *
from Doctor
where SpecialityID = 1;

select *
from Doctor
where Name != 'Dobryi Vladyslav Ivanovych';

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
where (SpecialityID = 1 and Qualification = 'Higher')
   or (SpecialityID >= 2 and Qualification = 'Second');

select TreatmentID,
       PatientID,
       year(VisitDay)  as Year,
       month(VisitDay) as Month,
       day(VisitDay)   as Day
from Treatment
where month(VisitDay) = 12;

select Name, PolyclinicID
from Doctor
where PolyclinicID in (1, 2);

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