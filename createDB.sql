use polyclinic;
create table Polyclinic
(
    PolyclinicID int not null auto_increment,
    Name         varchar(255) not null,
    Address      varchar(255) unique,
    primary key (PolyclinicID)
);

create table Speciality
(
    SpecialityID int not null auto_increment,
    Name         varchar(128) not null,
    Price        decimal(10, 2),
    primary key (SpecialityID)
);

create table Doctor
(
    DoctorID      int not null auto_increment,
    Name          varchar(64) not null,
    SpecialityID  int,
    Qualification varchar(32),
    PolyclinicID  int,
    primary key (DoctorID),
    foreign key (PolyclinicID) references Polyclinic (PolyclinicID)
);

create table Procedures
(
    ProcedureID int not null auto_increment,
    Name        varchar(255) not null,
    Price       decimal(10, 2),
    primary key (ProcedureID)
);

create table CitizenCategory
(
    CitizenCategoryID int not null auto_increment,
    Name              varchar(64) not null,
    Discount          decimal(10, 2),
    primary key (CitizenCategoryID)
);

create table Patient
(
    PatientID         int not null auto_increment,
    Name              varchar(32) not null,
    Surname           varchar(32) not null,
    MiddleName        varchar(32),
    Birthday          date,
    RegistrationDay   date not null,
    CitizenCategoryID int,
    primary key (PatientID),
    foreign key (CitizenCategoryID) references CitizenCategory (CitizenCategoryID)
);

create table Treatment
(
    TreatmentID int not null auto_increment,
    VisitDay    date not null,
    PatientID   int not null,
    primary key (TreatmentID),
    foreign key (PatientID) references Patient (PatientID)
);

create table DoctorTreatment
(
    DoctorTreatmentID int not null auto_increment,
    DoctorID          int not null,
    TreatmentID       int not null,
    Diagnosis         mediumtext,
    Amount            decimal(10, 2),
    primary key (DoctorTreatmentID),
    foreign key (DoctorID) references Doctor (DoctorID),
    foreign key (TreatmentID) references Treatment (TreatmentID)
);

create table TreatmentProcedure
(
    TreatmentProcedureID int not null auto_increment,
    TreatmentID          int not null,
    ProcedureID          int not null,
    Amount               decimal(10, 2),
    primary key (TreatmentProcedureID),
    foreign key (TreatmentID) references Treatment (TreatmentID),
    foreign key (ProcedureID) references Procedures (ProcedureID)
);
