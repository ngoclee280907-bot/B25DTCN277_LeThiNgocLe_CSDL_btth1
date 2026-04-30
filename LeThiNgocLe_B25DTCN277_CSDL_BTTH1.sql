create database education;
use education;

create table teachers (
	teacher_id varchar(5) primary key,
    teacher_name varchar(100) not null,
    salary decimal(12, 2) not null
);

create table courses (
	course_id varchar(5) primary key,
    course_name varchar(100) not null,
    teacher_id varchar(5),
    credits int not null,
    tuition_fee decimal(12, 2) not null,
    foreign key(teacher_id) references teachers(teacher_id)
);

create table students (
	student_id varchar(5) primary key,
    student_name varchar(100) not null,
    date_of_birth date not null,
    gender varchar(10) check (gender IN ('Male','Female'))
);

create table enrollments (
	erm_id varchar(5) primary key,
    student_id varchar(5) not null,
    course_id varchar(5) not null,
    dates date not null,
	score decimal(4, 2),
	foreign key(student_id) references students(student_id),
	foreign key(course_id) references courses(course_id)
);

insert into teachers (teacher_id, teacher_name, salary)
values ('T01','Nguyen Van A',15000000),
('T02','Tran Thi B',18000000),
('T03','Le Van C',20000000);

insert into courses (course_id, course_name, teacher_id, credits, tuition_fee)
values ('C01','IT Fundamentals','T01',3,2500000),
('C02','Advanced IT','T01',4,3000000),
('C03','Database Systems','T02',3,2800000),
('C04','Business English','T03',2,2000000),
('C05','Marketing Basics','T03',2,2200000),
('C06','Cyber Security',NULL,4,3500000);

insert into students (student_id, student_name, date_of_birth, gender)
values ('S01','Pham Minh A','2005-01-10','Male'),
('S02','Nguyen Thi B','2005-03-15','Female'),
('S03','Tran Van C','2004-07-21','Male'),
('S04','Le Thi D','2005-09-09','Female'),
('S05','Hoang Van E','2005-02-11','Male'),
('S06','Vo Thi F','2004-12-30','Female'),
('S07','Dang Van G','2005-06-18','Male'),
('S08','Bui Thi H','2005-04-25','Female'),
('S09','Pham Van I','2004-11-11','Male'),
('S10','Nguyen Thi K','2005-08-05','Female');

insert into enrollments (erm_id, student_id, course_id, dates, score)
values ('E01','S01','C01','2026-04-01',8.5),
('E02','S02','C01','2026-04-01',7.0),
('E03','S03','C02','2026-04-02',9.0),
('E04','S04','C02','2026-04-02',6.5),
('E05','S05','C03','2026-04-03',8.0),
('E06','S06','C03','2026-04-03',7.5),
('E07','S07','C04','2026-04-04',9.5),
('E08','S08','C04','2026-04-04',8.0),
('E09','S09','C05','2026-04-05',6.0),
('E10','S10','C05','2026-04-05',7.0),
('E11','S01','C06','2026-04-06',NULL),
('E12','S02','C06','2026-04-06',NULL),
('E13','S03','C01','2026-04-07',8.0),
('E14','S04','C03','2026-04-07',7.8),
('E15','S05','C04','2026-04-08',9.2);

-- Tang luong giang vien IT len 10%
update teachers t
join courses c on t.teacher_id = c.teacher_id
set t.salary = t.salary * 1.10
where c.course_name like '%IT%';

drop table enrollmants;


