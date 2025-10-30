create database students;
\c students;

table student_info (
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    enrollment_date date not null,
    city varchar(50),
    grade int
);

table courses (
    course_id serial primary key,
    course_name varchar(100) not null,
    student_id int references student_info(student_id),
    grade int
);

CREATE INDEX idx_student_id ON student_info(student_id);

select * from student_info order by grade DESC;
select * from student_info order by grade ASC;

select * from student_info offset 5 limit 10;

select city, COUNT(*) as student_count from student_info group by city;

select student_id, first_name, last_name, date_of_birth AS tugilgan_sana from student_info;

select student_id, course_id from courses where course_id = 1
union
select student_id, course_id from courses where course_id = 2;

select course_id, AVG(grade) as avg_grade from courses group by course_id having AVG(grade) > 80;

select * from student_info where (grade BETWEEN 70 AND 90 OR city = 'Toshkent');

select * from student_info where first_name ILIKE 'sh%' OR first_name ILIKE '%sh';


