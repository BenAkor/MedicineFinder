-- Create a new database called 'MedicineFinder'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'MedicineFinder'
)
CREATE DATABASE MedicineFinder
GO
-- Create a new table called 'Pharmacy' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Pharmacy', 'U') IS NOT NULL
DROP TABLE dbo.Pharmacy
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Pharmacy
(
    PharmacyID INT NOT NULL PRIMARY KEY, -- primary key column
    PharmacyName [NVARCHAR](300) NOT NULL,
    PharmacyAddress [NVARCHAR](300),
    PharmacyPhoneNumber [NVARCHAR] (15),
     -- specify more columns here
);
GO
-- Create a new table called 'Customer' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL
DROP TABLE dbo.Customer
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customer
(
    CustomerId INT NOT NULL PRIMARY KEY, -- primary key column
    CustomerFirstName [NVARCHAR](50) NOT NULL,
    CustomerMiddleName [NVARCHAR](50),
    CustomerLastName [NVARCHAR](50) NOT NULL,
    CustomerPhoneNumber [NVARCHAR] (15),
    CustomerAddress [NVARCHAR](300)
    -- specify more columns here
);
GO
-- Create a new table called 'Hospital' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Hospital', 'U') IS NOT NULL
DROP TABLE dbo.Hospital
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Hospital
(
    HospitalId INT NOT NULL PRIMARY KEY, -- primary key column
    HospitalName [NVARCHAR](150) NOT NULL,
    HospitalAddress [NVARCHAR](300) NOT NULL,
    HospitalPhoneNumber[NVARCHAR](15) NOT NULL
    -- specify more columns here
);
GO
-- Create a new table called 'Patient' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Patient', 'U') IS NOT NULL
DROP TABLE dbo.Patient
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Patient
(
    PatientId INT NOT NULL PRIMARY KEY, -- primary key column
    PatientFirstName [NVARCHAR](50) NOT NULL,
    PatientMiddleName [NVARCHAR](50),
    PatientLastName [NVARCHAR](50) NOT NULL,
    HospitalName [NVARCHAR] FOREIGN KEY REFERENCES dbo.Hospital (HospitalName)
    -- specify more columns here
);
GO
-- Create a new table called 'Doctor' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Doctor', 'U') IS NOT NULL
DROP TABLE dbo.Doctor
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Doctor
(
    DoctorId INT NOT NULL PRIMARY KEY, -- primary key column
    DoctorFirstName [NVARCHAR](50) NOT NULL,
    DoctorMiddleName [NVARCHAR](50),
    DoctorLastName [NVARCHAR](50),
    DoctorPhoneNumber [NVARCHAR](50),
    HospitalName [NVARCHAR] FOREIGN KEY REFERENCES dbo.Hospital (HospitalName)
    -- specify more columns here
);
GO