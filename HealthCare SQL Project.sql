CREATE Database SQL_Assignment
Use SQL_Assignment
-------------HealthCare Management Data-------------
CREATE TABLE Patients(
    PatientID INT PRIMARY KEY IDENTITY(1,1),
    First_Name VARCHAR(50),
    Last_Name NVARCHAR(50),
    DOB DATE,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(15),
    Address VARCHAR(255),
    Status VARCHAR(50)
);
INSERT INTO Patients(First_Name, Last_Name, DOB, Gender, Contact_Number, Address, Status)
VALUES
('Arjun', 'Verma', '1985-04-12', 'Male', '9876543210', 'Mumbai, Maharashtra', 'Active'),
('Neha', 'Sharma', '1990-07-23', 'Female', '9876543211', 'Delhi, Delhi', 'Active'),
('Rohan', 'Singh', '1982-01-30', 'Male', '9876543212', 'Bangalore, Karnataka', 'Active'),
('Priya', 'Mehta', '1995-09-15', 'Female', '9876543213', 'Chennai, Tamil Nadu', 'InActive'),
('Amit', 'Kumar', '1987-05-20', 'Male', '9876543214', 'Pune, Maharashtra', 'Active'),
('Sneha', 'Patel', '1991-12-11', 'Female', '9876543215', 'Ahmedabad, Gujarat', 'Active'),
('Vikram', 'Joshi', '1984-08-25', 'Male', '9876543216', 'Kolkata, West Bengal', 'Active'),
('Pooja', 'Rao', '1993-11-30', 'Female', '9876543217', 'Hyderabad, Telangana', 'Active'),
('Rahul', 'Nair', '1988-03-22', 'Male', '9876543218', 'Thiruvananthapuram, Kerala', 'Active'),
('Anita', 'Desai', '1992-10-05', 'Female', '9876543219', 'Jaipur, Rajasthan', 'Active');
SELECT * FROM Patients
----------------------CREATE DOCTORS TABLE----------------
CREATE TABLE Doctors(
    DoctorID INT PRIMARY KEY IDENTITY(1,1),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Specialty VARCHAR(50),
    Contact_Number VARCHAR(15),
    Email VARCHAR(100)
);
INSERT INTO Doctors(First_Name, Last_Name, Specialty, Contact_Number, Email) VALUES
('Dr. Ravi', 'Patel', 'Cardiology', '9876543215', 'ravi.patel@example.com'),
('Dr. Deepthi', 'Desai', 'Neurology', '9876543216', 'deepthi.desai@example.com'),
('Dr. Anil', 'Joshi', 'Orthopedics', '9876543217', 'anil.joshi@example.com'),
('Dr. Meera', 'Rao', 'Pediatrics', '9876543218', 'meera.rao@example.com'),
('Dr. Vikram', 'Kapoor', 'Dermatology', '9876543219', 'vikram.kapoor@example.com');

SELECT* FROM Doctors

----- Create Appointment Table------------

CREATE TABLE Appointment(
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    Status NVARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
INSERT INTO Appointment(PatientID, DoctorID, AppointmentDate, Status)
VALUES
(1, 1, '2024-07-01 10:00:00', 'Completed'),
(2, 2, '2024-07-05 11:00:00', 'Completed'),
(3, 3, '2024-07-10 12:00:00', 'Completed'),
(4, 4, '2024-07-15 09:00:00', 'Completed'),
(5, 5, '2024-07-20 14:00:00', 'Completed'),
(6, 1, '2024-08-01 10:30:00', 'Completed'),
(7, 1, '2024-08-06 11:30:00', 'Completed'),
(8, 2, '2024-08-11 12:30:00', 'Pending'),
(9, 3, '2024-08-16 09:30:00', 'Pending'),
(10, 3, '2024-08-21 14:30:00', 'Pending');


SELECT * FROM Appointment
---------- Create MedicalRecords Table-------------
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    DoctorID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    RecordDate DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, RecordDate)
VALUES
(1, 1, 'Hypertension', 'Medication', '2024-07-01 10:00:00'),
(2, 2, 'Migraine', 'Therapy', '2024-07-05 11:00:00'),
(3, 3, 'Fracture', 'Surgery', '2024-07-10 12:00:00'),
(4, 4, 'Flu', 'Medication', '2024-07-15 09:00:00'),
(5, 5, 'Skin Allergy', 'Topical Cream', '2024-07-20 14:00:00'),
(6, 1, 'Diabetes', 'Insulin', '2024-08-01 10:30:00'),
(7, 2, 'Epilepsy', 'Medication', '2024-08-06 11:30:00')

SELECT* FROM MedicalRecords
-------------Create Prescriptions Table-----------
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1),
    RecordID INT,
    Medication VARCHAR(255),
    Dosage VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (RecordID) REFERENCES MedicalRecords(RecordID)
);
INSERT INTO Prescriptions (RecordID, Medication, Dosage, StartDate, EndDate)
VALUES
(1, 'Amlodipine', '5mg', '2024-07-01', '2024-07-31'),
(2, 'Sumatriptan', '50mg', '2024-07-05', '2024-07-15'),
(3, 'Ibuprofen', '400mg', '2024-07-10', '2024-07-20'),
(4, 'Oseltamivir', '75mg', '2024-07-15', '2024-07-25'),
(5, 'Hydrocortisone', '1%', '2024-07-20', '2024-07-30'),
(6, 'Metformin', '500mg', '2024-08-01', '2024-08-31'),
(7, 'Carbamazepine', '200mg', '2024-08-06', '2024-08-16')

SELECT* FROM Prescriptions
------------------ Create Billing Table-----------
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT,
    Amount DECIMAL(10, 2),
    Billing_Date DATE,
    Payment_Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);
INSERT INTO Billing (PatientID, Amount, Billing_Date, Payment_Status)
VALUES
(1, 1500.00, '2024-07-02', 'Paid'),
(2, 2000.00, '2024-07-06', 'Paid'),
(3, 2000.00, '2024-07-11', 'Pending'),
(4, 500.00, '2024-07-16', 'Paid'),
(5, 800.00, '2024-07-21', 'Paid'),
(6, 1800.00, '2024-08-02', 'Pending'),
(7, 2200.00, '2024-08-07', 'Paid')

SELECT* FROM  Billing ----
---------- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    Department_Name VARCHAR(50),
    Head_DoctorID INT,
    FOREIGN KEY (Head_DoctorID) REFERENCES Doctors(DoctorID)
);
INSERT INTO Departments (Department_Name, Head_DoctorID) VALUES
('Cardiology', 1),
('Neurology', 2),
('Orthopedics', 3),
('Pediatrics', 4),
('Dermatology', 5);

SELECT* FROM   Departments
---- Create Hospital_Staff Table--------
CREATE TABLE Hospital_Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    First_Name VARCHAR(50),
    Last_Name NVARCHAR(50),
    Position NVARCHAR(50),
    Department_ID INT,
    Contact_Number NVARCHAR(15),
    FOREIGN KEY (Department_ID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Hospital_Staff (First_Name, Last_Name, Position, Department_ID, Contact_Number) VALUES
('Ramesh', 'Khan', 'Nurse', 1, '9876543220'),
('Sita', 'Gupta', 'Technician', 2, '9876543221'),
('Arvind', 'Nair', 'Surgeon', 3, '9876543222'),
('Pooja', 'Bose', 'Nurse', 4, '9876543223'),
('Kiran', 'Yadav', 'Technician', 5, '9876543224');

SELECT * FROM Hospital_Staff
------------------------------------------------------Important Commands in Sql--------------------------
----Select---Use to retrieve data from one or more tables---
Select * From Doctors
Select Specialty from Doctors
-----Where Clause--Filters and retrieve records based on specified conditions--------

SELECT * FROM Patients WHERE Gender= 'Female'

SELECT First_Name, Last_Name 
FROM Doctors
WHERE First_Name = 'Dr. Deepthi';
-----OrderBy-----
SELECT * FROM Patients ORDER BY Last_Name ASC;
SELECT * FROM Patients ORDER BY Last_Name DESC;
SELECT * FROM Patients ORDER BY Gender ASC;
SELECT * FROM Patients ORDER BY Gender Desc;
--------------Count-----------------
SELECT COUNT(*) FROM Appointment;
SELECT COUNT(*) FROM Departments;
SELECT COUNT(*) FROM MedicalRecords;

SELECT COUNT(*) FROM Patients where Gender = 'Female';
-----------------Aggregate Functions------------------
---SUM()----

SElECT * FROM Billing;
SELECT SUM(Amount) as TotalBilling FROM Billing;
----Avearge()------
SElECT * FROM Billing;
SELECT AVG(Amount) as AvgBilling FROM Billing;
-----------MAX()-----
SElECT * FROM Billing;
SELECT MAX(Amount) as HighestBilling FROM Billing;
--------Min()-------
SElECT * FROM Billing;
SELECT MIN(Amount) as LowestBilling FROM Billing;
------------SubQuery----------------------------
------Question: Retrieve doctors who have appointments scheduled after '2023-01-01'-------------
Select  First_Name Last_Name From Doctors
WHERE DoctorID IN (SELECT DISTINCT DoctorID FROM Appointment WHERE AppointmentDate > '2023-01-01');
Select * From Doctors
Select * From Appointment
----------------------Group By----------------
SELECT * FROM Patients
SELECT Gender, COUNT(*) AS NumberOfPatients
FROM Patients
GROUP BY Gender;
-----------Having---------------------------
-------Retrieve doctors who have more than 10 appointments.-----------------
SELECT * FROM Appointment
SELECT DoctorID, Count(*) As AppointmentID
FROM Appointment
GROUP BY DoctorID
HAVING COUNT(*)>10
-------------------------------------------the output of the query will be an empty result set since no doctor currently has more than 10 appointments---------
-----------------Joins--------------
SELECT * FROM Patients
SELECT * FROM Appointment
SELECT * FROM Doctors
----------Retrieve patients who have never had an appointment name for all appointments--------------------
SELECT P.First_Name,P.Last_Name
From Patients P
Left Join Appointment A
ON
P.PatientID = A.PatientID
WHERE A.AppointmentDate is NULL
--------------Retrieve patients' names along with their doctors' names for all appointments-------------
SELECT P.First_Name AS PatientFirstName,
		P.Last_Name As PatientLastName,
		D.First_Name As DoctorFirstName,
		D.Last_Name As DoctorLastName
		From Appointment A
		Inner Join Patients P
		On A.PatientID = P.PatientID
		Inner Join Doctors D
		On A.PatientID = D.DoctorID
------------Also with appointment date------------
SELECT P.First_Name AS PatientFirstName,
		P.Last_Name As PatientLastName,
		D.First_Name As DoctorFirstName,
		D.Last_Name As DoctorLastName,
		A.AppointmentDate
		From Appointment A
		Inner Join Patients P
		On A.PatientID = P.PatientID
		Inner Join Doctors D
		On A.PatientID = D.DoctorID;
-------------------------Union-----------------------
---Retrieve names from both the Doctors and Patients tables
SELECT First_Name, Last_Name FROM Doctors
UNION 
SELECT First_Name, Last_Name FROM Patients
----------------------Window function------------
---Assign row numbers to billing records ordered by amount------
SELECT* FROM  Billing ----
Select Amount, ROW_NUMBER() OVER (ORDER BY Amount Desc) AS "Row_Num" FROM Billing
--------RANK---------

SELECT* FROM  Billing ----
Select Amount, RANK() OVER (ORDER BY Amount Desc) AS "Row_Num" FROM Billing
--------------------DENSE_RANK------------------
SELECT* FROM  Billing ----
Select Amount, DENSE_RANK() OVER (ORDER BY Amount Desc) AS "Row_Num" FROM Billing
---------COMMAN TABLE EXPRESSION_(CTE)-----------------------------

Select * From Doctors
Select * From Appointment
Select * From Patients
------------------Retrieve doctors and the number of patients they have seen----

WITH PatientCounts AS (
    SELECT DoctorID, COUNT(*) AS NumberOfPatients
    FROM 
	Appointment
    GROUP BY 
	DoctorID
)
SELECT Concat(D.First_Name,' ',D.Last_Name) as DoctorName, P.NumberOfPatients
FROM Doctors D
JOIN PatientCounts P ON D.DoctorID = P.DoctorID;
--------------------Co-related SubQuery------------------



-------------- Some Questions to practice in health System Project------
SELECT * FROM Patients
SELECT * FROM Appointment
---Question 1--List all patients' names and their contact numbers---

SELECT First_Name,Last_Name,Contact_Number FROM Patients;

---Question 2-- Find the number of male and female Active patients-----

SELECT Gender, COUNT(*) AS Active_Patients
FROM Patients
WHERE Status = 'Active'
GROUP BY Gender;

----Question 3---Retrieve the details of Active patients who had appointments scheduled in the last 7 days------
---------------------
SELECT 
    P.PatientID, 
    P.First_Name, 
    P.Last_Name, 
    P.DOB, 
    P.Gender, 
    P.Contact_Number, 
    P.Address, 
    P.Status
FROM 
    Patients P
JOIN 
    Appointment A ON P.PatientID = A.PatientID
WHERE 
    P.Status = 'Active'
 AND AppointmentDate >= DATEADD(DAY, -7, GETDATE());

 ---Question 4--Retrieve the details of ACTIVE patients who have appointments scheduled in the next 7 days
 SELECT 
    P.PatientID, 
    P.First_Name, 
    P.Last_Name, 
    P.DOB, 
    P.Gender, 
    P.Contact_Number, 
    P.Address, 
    P.Status
FROM 
    Patients P
JOIN 
    Appointment A ON P.PatientID = A.PatientID
WHERE 
    P.Status = 'Active'
 AND AppointmentDate BETWEEN  GETDATE() AND DATEADD(DAY, 7, GETDATE());

 ----Question 5: List all doctors along with their specialties-----------

SELECT First_Name, Last_Name, Specialty
FROM Doctors;

-------Question 6: Find the number of doctors in each specialty------------

SELECT Specialty, COUNT(*) AS NumberOfDoctors
FROM Doctors
GROUP BY Specialty;

-------Question 7: Retrieve the details of doctors who have more than 1 appointments in the current month------------
SELECT *
FROM Doctors;
SELECT *
FROM Appointment;

--------------
SELECT D.First_Name, D.Last_Name, COUNT(A.AppointmentID) AS AppointmentCount
FROM Doctors D
JOIN Appointment A 
ON D.DoctorID = A.DoctorID
WHERE MONTH(A.AppointmentDate) = MONTH(GETDATE())
  AND YEAR(A.AppointmentDate) = YEAR(GETDATE())
GROUP BY D.First_Name, D.Last_Name
HAVING COUNT(A.AppointmentID) > 1;

-------Question 8: Find the total number of appointments scheduled in the current year----------------
SELECT *
FROM Appointment;
-----------------------------------------------------------------
SELECT Count(*) AS Total_Appointment FROM Appointment
WHERE
YEAR(AppointmentDate)= Year(GETDATE());
----------------------------------
---Question 9:List the appointments that are still pending (status 'Pending')--------
SELECT * FROM Appointment
WHERE Status = 'Pending';

-----Question10: Retrieve the details of appointments along with patient and doctor names------------
------------------------
SELECT A.AppointmentID, P.First_Name As Patients_First_Name,P.Last_Name As Patients_Last_Name,
D.First_Name As Doctors_First_Name,D.Last_Name As Doctors_Last_Name,A.AppointmentDate,A.Status
From Appointment A
JOIN Patients P ON  P.PatientID = A.PatientID
JOIN Doctors D On D.DoctorID = A.DoctorID;
----------------------------------------
SELECT *
FROM Appointment;
SELECT *
FROM Patients;
SELECT *
FROM Doctors;
-------Question 11: Find the most common diagnosis given by doctors---------------
---------------------------
SELECT* FROM MedicalRecords
----------------------------------
SELECT Diagnosis,COUNT(*) AS Frequency
FROM MedicalRecords
GROUP BY Diagnosis
ORDER BY Frequency DESC
--------------------------------------
--Question 12: Find the medications that have been prescribed the most------------------------
-----------------
SELECT * FROM Prescriptions
--------------
SELECT Medication ,COUNT(*) AS PrescriptionCount
FROM Prescriptions
Group By Medication
Order By PrescriptionCount DESC;
-----------
--------Question 13: Retrieve the details of unpaid bills------------------------
SELECT * FROM Billing
---------------------
SELECT * FROM Billing
WHERE Payment_Status = 'Pending';
------------------------------------
------Question 14: Find the total billing amount for the current month----------------------
-----------------------------
SELECT SUM(Amount) AS TotalBilling
FROM Billing
WHERE Month(Billing_Date)= Month(GetDate())
AND Year(Billing_Date)= Year(GetDate());
----------------------------------------------------
----Question 15: Find the number of staff members in each department-----------------------------------

-------------------------------
Select * From Hospital_Staff
Select * From Departments
------
SELECT Department_Name,COUNT(StaffID) As Staff_Count
FROM Departments D
Join Hospital_Staff HS On D.DepartmentID = HS.Department_ID
Group By Department_Name;
-----------------------------

----Question 16: List the top 3 doctors with the highest number of appointments--------------------------------------
Select * From Doctors
Select * From Appointment
------------------
SELECT TOP 3 D.First_Name As Doctors_Name, COUNT(A.AppointmentID) AS AppointmentCount
FROM Appointment A
JOIN Doctors D ON A.DoctorID = D.DoctorID
GROUP BY D.First_Name
ORDER BY AppointmentCount DESC;
------------------------------------------
WITH DoctorAppointments AS (
    SELECT DoctorID, COUNT(*) AS NumberOfAppointments
    FROM Appointment
    GROUP BY DoctorID
)

    SELECT TOP 3 DA.DoctorID,Concat(First_Name,' ',Last_Name) AS DoctorName, DA.NumberOfAppointments
    FROM DoctorAppointments DA
    INNER JOIN Doctors D ON DA.DoctorID = D.DoctorID
    ORDER BY DA.NumberOfAppointments DESC
