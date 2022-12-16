select count(PatientID) as NumberOfPatient
from Patient;

select sum(Price) as TotalAmountOfProcedures
from Procedures;

select upper(Name) as UppercasePatientName
from Patient;
select lower(Name) as UppercasePatientName
from Patient;

select date('2022-08-27') as Date;
select adddate(curdate(), interval 5 day) as CurDatePlus5Day;
select *,
       date_format(RegistrationDay, '%W %m.%d.%Y') as NewFormatForRegistrationDay
from Patient;

select *
from Doctor;
select count(DoctorID) as NumOfDoctorInEachPolyclinic, PolyclinicID
from Doctor
group by PolyclinicID;

select count(DoctorID) as NumOfDoctorInEachPolyclinic, PolyclinicID
from Doctor
group by PolyclinicID
having count(DoctorID) != 2;

select *
from Speciality;
select sum(Price) as TotalAmountOfSpeciality
from Speciality
having sum(Price) > 1010;

select row_number() over () RowNum, Name, Birthday
from Patient;

select *
from Speciality
order by Name, Price;
