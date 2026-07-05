CREATE DATABASE HospitalDB;
GO

USE HospitalDB;
GO
-- =============================================
-- TABLE 1: Patients
-- =============================================
CREATE TABLE Patients (
    PatientID        INT IDENTITY(1,1) PRIMARY KEY,
    FirstName        VARCHAR(50),
    LastName         VARCHAR(50),
    DateOfBirth      DATE,
    Gender           VARCHAR(10),
    BloodGroup       VARCHAR(5),
    ContactNumber    VARCHAR(15),
    Email            VARCHAR(100),
    Address          VARCHAR(200),
    City             VARCHAR(50),
    State            VARCHAR(50),
    InsuranceProvider VARCHAR(100),
    InsuranceNumber  VARCHAR(50),
    RegistrationDate DATE,
    IsActive         BIT DEFAULT 1
);
-- =============================================
-- TABLE 2: Departments
-- =============================================
CREATE TABLE Departments (
    DepartmentID    INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName  VARCHAR(100),
    DepartmentCode  VARCHAR(10),
    Floor           INT,
    TotalBeds       INT,
    HeadDoctorName  VARCHAR(100),
    ContactExtension VARCHAR(10),
    IsActive        BIT DEFAULT 1
);
-- =============================================
-- TABLE 3: Admissions
-- =============================================
CREATE TABLE Admissions (
    AdmissionID      INT IDENTITY(1,1) PRIMARY KEY,
    PatientID        INT FOREIGN KEY REFERENCES Patients(PatientID),
    DepartmentID     INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    AdmissionDate    DATETIME,
    DischargeDate    DATETIME NULL,
    AdmissionType    VARCHAR(20),   -- Emergency, Planned, Transfer
    BedNumber        VARCHAR(10),
    PrimaryDiagnosis VARCHAR(200),
    AttendingDoctorID INT,
    AdmissionStatus  VARCHAR(20),   -- Active, Discharged, ICU, Transferred
    TotalBillAmount  DECIMAL(10,2),
    InsuranceCovered DECIMAL(10,2),
    PatientPaid      DECIMAL(10,2),
    CreatedDate      DATETIME DEFAULT GETDATE()
);
-- =============================================
-- TABLE 4: Doctors
-- =============================================
CREATE TABLE Doctors (
    DoctorID         INT IDENTITY(1,1) PRIMARY KEY,
    FirstName        VARCHAR(50),
    LastName         VARCHAR(50),
    Specialization   VARCHAR(100),
    DepartmentID     INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    LicenseNumber    VARCHAR(50),
    ContactNumber    VARCHAR(15),
    Email            VARCHAR(100),
    YearsOfExperience INT,
    ConsultationFee  DECIMAL(8,2),
    JoiningDate      DATE,
    EmploymentType   VARCHAR(20),   -- Full-Time, Part-Time, Contract
    IsActive         BIT DEFAULT 1
);
-- =============================================
-- TABLE 5: Treatments
-- =============================================
CREATE TABLE Treatments (
    TreatmentID      INT IDENTITY(1,1) PRIMARY KEY,
    AdmissionID      INT FOREIGN KEY REFERENCES Admissions(AdmissionID),
    DoctorID         INT FOREIGN KEY REFERENCES Doctors(DoctorID),
    TreatmentDate    DATETIME,
    TreatmentType    VARCHAR(100),  -- Surgery, Medication, Therapy, Diagnostic
    TreatmentName    VARCHAR(200),
    TreatmentCost    DECIMAL(10,2),
    MedicationGiven  VARCHAR(500),
    TreatmentOutcome VARCHAR(50),   -- Successful, Ongoing, Referred, Complications
    Notes            VARCHAR(1000),
    CreatedDate      DATETIME DEFAULT GETDATE()
);
