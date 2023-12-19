create database hospital_portal_DH;
use hospital_portal_DH;



create table patients (
    patient_id int not null auto_increment primary key,
    patient_name varchar(45) not null,
    age int not null,
    admission_date date,
    discharge_date date
);



create table doctors (
 doctor_id int not null auto_increment primary key,
 doctor_name varchar(45) not null,
 type_of_doctor varchar(45) not null
);
insert into doctors (doctor_name, type_of_doctor)
values 
 ('Eric Carlton', 'Oncologist'),
 ('Kaitlyn Boucher', 'Pediatrician'),
 ('James Gonzales', 'Dermatologist');
 
 
create table appointments (
    appointment_id int not null auto_increment primary key,
    patient_id int not null,
    doctor_id int not null,
    appointment_date date not null,
    appointment_time decimal not null,
    foreign key (patient_id)
        references patients(patient_id),
    foreign key (doctor_id) 
        references doctors(doctor_id)
);



insert into patients (patient_name, age, admission_date, discharge_date)
values 
 ('Jack Zimmerman', 55, '2023-10-30', '2023-11-07'),
 ('Miguel Rivera', 34, '2023-11-15', '2023-11-19'),
 ('Ashley Smith', 22, '2023-12-04', '2023-12-06');

delimiter //



create procedure schedule_appointment(
 in SA_patient_id int,
 in SA_doctor_id int,
 in SA_appointment_date date,
 in SA_appointment_time decimal
)
begin
 insert into appointments (patient_id, doctor_id, appointment_date, appointment_time)
 values (SA_patient_id, SA_doctor_id, SA_appointment_date, SA_appointment_time);
end //

delimiter //


create procedure discharge_patient(
 in DP_patient_id int,
 in DP_discharge_date date
)
begin
 update patients
 set discharge_date = CURRENT_DATE()
 where patient_id = DP_patient_id;
end //

delimiter //





