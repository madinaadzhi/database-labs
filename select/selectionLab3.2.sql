select Name,
       SpecialityID,
       (select Name from Speciality where SpecialityID = Doctor.SpecialityID) as SpecialityName
from Doctor;

select *
from Treatment
where PatientID in (select PatientID from Patient where year(Birthday) > 1980);
select *
from Patient;

-- Список всех пациентов которые хотя бы 1 раз пришли на приём
select *
from Patient
where exists(select * from Treatment where Patient.PatientID = Treatment.PatientID);

select Name, Surname
from Patient
where PatientID in (select PatientID from Treatment where VisitDay = '2022-12-14');

select TreatmentID, VisitDay, Name, Surname
from Treatment
         cross join Patient on Treatment.PatientID = Patient.PatientID;

select p.Name, Surname, MiddleName, Birthday, cc.Name
from Patient p
         inner join CitizenCategory cc on p.CitizenCategoryID = cc.CitizenCategoryID;

select d.Name, s.Name
from Doctor d
         join Speciality s on s.SpecialityID = d.SpecialityID
where s.Name = 'Pediatrician';

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