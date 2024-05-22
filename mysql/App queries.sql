-- Finding a student by name and showing their password hash and last login
select s.fname,s.lname,s.username, s.lastLogin, sp.passwordhash  from Student s
    join StudentPasswordHash sp on s.id = sp.studentid
           where s.fname like '%%' and s.lname like '%%';
