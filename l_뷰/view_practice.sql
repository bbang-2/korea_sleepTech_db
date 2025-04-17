### 뷰 연습 문제 ###
create database school;
use school;

-- Students 테이블 생성 -- 
create table students (
	student_id int primary key,
    first_name varchar(50),
    last_name varchar(50),
    age int,
    major varchar(50)
);

create table courses (
	course_id int primary key,
    course_name varchar(100),
    instructor varchar(100),
    credit_hours int
);

create table student_courses (
	student_id int,
    course_id int,
    primary key (student_id, course_id),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);

INSERT INTO students (student_iD, first_name, last_name, Age, Major)
VALUES (1, 'John', 'Doe', 20, 'Computer Science'),
       (2, 'Jane', 'Smith', 22, 'Mathematics'),
       (3, 'Alice', 'Johnson', 19, 'Biology'),
       (4, 'Bob', 'Brown', 21, 'History');

INSERT INTO Courses (course_id, course_name, instructor, credit_hours)
VALUES (101, 'Introduction to Programming', 'Prof. Smith', 3),
       (102, 'Calculus I', 'Prof. Johnson', 4),
       (103, 'Biology 101', 'Prof. Davis', 3),
       (104, 'World History', 'Prof. Wilson', 3);
       
INSERT INTO student_courses (student_id, course_id)
VALUES (1, 101),
       (2, 102),
       (3, 103),
       (4, 104);
       
create view v_student_course
as
	select S.first_name 성, S.last_name 이름, C.course_name 강의명, C.instructor 강사명
    from student_courses SC
    join students S
		on SC.student_id = S.student_id
	join courses C
		on Sc.course_id = C.course_id;
	
select * from v_student_course;