SET GLOBAL local_infile = true;
SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE './data/Polyclinic - Polyclinic.csv'
    INTO TABLE polyclinic.Polyclinic
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
(Name, Address);
select * from Polyclinic;

LOAD DATA LOCAL INFILE './data/Polyclinic - Speciality.csv'
    INTO TABLE polyclinic.Speciality
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (Name, Price);
select * from Speciality;

LOAD DATA LOCAL INFILE './data/Polyclinic - Doctor.csv'
    INTO TABLE polyclinic.Doctor
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (Name, SpecialityID, Qualification, PolyclinicID);
select * from Doctor;

LOAD DATA LOCAL INFILE './data/Polyclinic - Procedures.csv'
    INTO TABLE polyclinic.Procedures
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (Name, Price);
select * from Procedures;

LOAD DATA LOCAL INFILE './data/Polyclinic - CitizenCategory.csv'
    INTO TABLE polyclinic.CitizenCategory
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (Name, Discount);
select * from CitizenCategory;

LOAD DATA LOCAL INFILE './data/Polyclinic - Patient.csv'
    INTO TABLE polyclinic.Patient
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (Name, Surname, MiddleName, Birthday, RegistrationDay, CitizenCategoryID);
select * from Patient;

LOAD DATA LOCAL INFILE './data/Polyclinic - Treatment.csv'
    INTO TABLE polyclinic.Treatment
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (VisitDay, PatientID);
select * from Treatment;

LOAD DATA LOCAL INFILE './data/Polyclinic - DoctorTreatment.csv'
    INTO TABLE polyclinic.DoctorTreatment
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (DoctorID, TreatmentID, Diagnosis, Amount);
select * from DoctorTreatment;

LOAD DATA LOCAL INFILE './data/Polyclinic - TreatmentProcedure.csv'
    INTO TABLE polyclinic.TreatmentProcedure
    FIELDS TERMINATED BY ';' IGNORE 1 LINES
    (TreatmentID, ProcedureID, Amount);
select * from TreatmentProcedure;
