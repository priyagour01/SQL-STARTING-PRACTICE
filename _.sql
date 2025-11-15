# 1= Show all doctors with their department:
use Hospital_Management;
select doctor_name, specialization, department_name from doctors join 
departments on doctors.department_id = departments.department_id;