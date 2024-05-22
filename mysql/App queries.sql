-- Finding a student by name and showing their password hash and last login
select s.id, s.fname,s.lname,s.username, s.lastLogin, sp.passwordhash  from Student s
    join StudentPasswordHash sp on s.id = sp.studentid
           where s.fname like '%jona%' and s.lname like '%ander%';


-- Change the student password hash of the password AsdfgZxcv!23 for student with id 9999999999
update StudentPasswordHash sp
    join Student s on s.id = sp.studentid
    set sp.passwordHash = '$2a$10$IgBn59aQNaqXRycfhAYoBOyEP6..KvhiXKXeYhv11LmTL0gGEVOAS'
    where s.id = 9999999999;