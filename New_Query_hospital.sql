-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

-- Insert dummy records into Departments
INSERT INTO Departments (Name, Location)
VALUES 
('Cardiology', 'Building A'),
('Dermatology', 'Building B'),
('Pediatrics', 'Building C'),
('Oncology', 'Building D'),
('Neurology', 'Building E');

-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) ON DELETE RESTRICT
);

-- Insert dummy records into Doctors
INSERT INTO Doctors (Name, Specialization, Phone, DepartmentID)
VALUES 
('Dr. Ahmad', 'Cardiologist', '1234567890', 1),
('Dr. Thanvir', 'Dermatologist', '1234567891', 2),
('Dr. Rafique', 'Pediatrician', '1234567892', 3),
('Dr. Nigah', 'Oncologist', '1234567893', 4),
('Dr. Era', 'Neurologist', '1234567894', 5);

-- Create Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL CHECK (Age > 0),
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Phone VARCHAR(15) NOT NULL UNIQUE
);

-- Insert dummy records into Patients
INSERT INTO Patients (Name, Age, Gender, Phone)
VALUES 
('Rahim', 30, 'Female', '9876543210'),
('Jabed', 45, 'Male', '9876543211'),
('Morzina', 25, 'Male', '9876543212'),
('Daisy', 40, 'Female', '9876543213'),
('Eva', 35, 'Female', '9876543214');

-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL
);

-- Insert dummy records into Appointments
INSERT INTO Appointments (Date, Time, Status)
VALUES 
('2024-12-21', '09:00:00', 'Scheduled'),
('2024-12-21', '10:00:00', 'Completed'),
('2024-12-22', '11:30:00', 'Cancelled'),
('2024-12-23', '13:00:00', 'Scheduled'),
('2024-12-24', '15:00:00', 'Scheduled');

-- Create Junction Table: DoctorPatientAppointments
CREATE TABLE DoctorPatientAppointments (
    DoctorID INT NOT NULL,
    PatientID INT NOT NULL,
    AppointmentID INT NOT NULL,
    PRIMARY KEY (DoctorID, PatientID, AppointmentID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID) ON DELETE RESTRICT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID) ON DELETE RESTRICT,
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID) ON DELETE CASCADE
);

-- Insert dummy records into DoctorPatientAppointments
INSERT INTO DoctorPatientAppointments (DoctorID, PatientID, AppointmentID)
VALUES 
(1, 1, 1), 
(2, 2, 2), 
(3, 3, 3),
(4, 4, 4),
(5, 5, 5)
