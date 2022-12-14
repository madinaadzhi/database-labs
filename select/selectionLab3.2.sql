select Name, SpecialityID, (select Name from Speciality where SpecialityID = Doctor.SpecialityID) as SpecialityName
from Doctor;

select *
from (select Name as DoctorsName from Doctor where PolyclinicID = 1) Polyclinic;

select *
from Patient
where exists(select Name from CitizenCategory where CitizenCategoryID = PatientID and Name = 'Student');

select Name, Surname
from Patient
where PatientID in (select PatientID from Treatment where VisitDay = '2022-04-04');

select Doctor.Name, Patient.Name
from Doctor
         cross join Patient;

select Patient.Name, Surname, MiddleName, Birthday
from Patient,
     CitizenCategory
where PatientID = CitizenCategory.CitizenCategoryID;

select Patient.Name, Surname, MiddleName, Birthday
from Patient,
     CitizenCategory
where PatientID = CitizenCategory.CitizenCategoryID
  and CitizenCategory.CitizenCategoryID > 2;

select Patient.Name, CitizenCategory.Name
from Patient
         inner join CitizenCategory
                    on Patient.CitizenCategoryID = CitizenCategory.CitizenCategoryID;

select Doctor.Name, Speciality.SpecialityID
from Doctor
         left outer join Speciality
                          on Doctor.SpecialityID = Speciality.SpecialityID;

select Doctor.Name, Speciality.SpecialityID
from Doctor
         right outer join Speciality
                          on Doctor.SpecialityID = Speciality.SpecialityID;

select Name
from Doctor
where PolyclinicID = 1
union
select Name
from Patient
where CitizenCategoryID = 2;