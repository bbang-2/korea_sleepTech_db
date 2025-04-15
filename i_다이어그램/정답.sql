create database `school_db`;
use school_db;

# 테이블 간 관계
###
# 1. 교수-강의(1:N, 일대다)
# : 한 명의 교수는 여러 강의를 담당
# : 강의 테이블에 담당교수 id 존재 - FK 참조값
# - ERD 선: 점선(비식별 관계)
#	>> 교수ID가 FK로만 사용 (PK x)

# 2. 학생 - 수강내역 - 강의 (N:M, 다대다)
# : 학생은 여러 강의를 수강 할 수 있고
# : 한 강의는 여러 학생이 수강할 수 있음
# >> 다대다(N:M)의 관계는 RDB에서 직접적인 표현이 불가!
#		: 중간 테이블로 해경
# - 다대다(N:M)관계는 두 개의 1:N 관계로 분해
		# 학생 - 수강내역 (N:1)
		# 강의 - 수강내역 (N:1)

create table `students` (
	std_id int auto_increment primary key,
    std_name varchar(100),
    std_major varchar(100),
    entrance_year year
);

create table `professors` (
	pro_id int auto_increment primary key,
    pro_name varchar(100),
    pro_major varchar(100),
    office varchar(100)
);

create table `Courses` (
	cour_id int primary key,
    cour_name varchar(100),
    cour_pro_id int,
    credit int,
    
    foreign key (cour_pro_id) references `professors`(pro_id)
);

create table `Enrollments` (
	enr_id int primary key,
    std_id int,
    cour_id int,
    enr_year year,
    term int,
    
     foreign key (std_id) references `students`(std_id),
     foreign key (cour_id) references `courses`(cour_id)
);
-- Students
INSERT INTO Students VALUES (1, 'Alice', 'Computer Science', 2020);
INSERT INTO Students VALUES (2, 'Bob', 'Mathematics', 2021);
INSERT INTO Students VALUES (3, 'Charlie', 'Physics', 2022);

-- Professors
INSERT INTO Professors VALUES (1, 'Dr. Smith', 'Computer Science', 'Room 101');
INSERT INTO Professors VALUES (2, 'Dr. Johnson', 'Mathematics', 'Room 102');
INSERT INTO Professors VALUES (3, 'Dr. Williams', 'Physics', 'Room 103');

-- Courses
INSERT INTO Courses VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses VALUES (2, 'Calculus I', 2, 4);
INSERT INTO Courses VALUES (3, 'Mechanics', 3, 4);

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 1, 2023, 1);
INSERT INTO Enrollments VALUES (2, 2, 2, 2023, 1);
INSERT INTO Enrollments VALUES (3, 3, 3, 2023, 1);

/*
	1. 전공이 컴퓨터 과학인 학생들의 이름과 입학년도를 조회하는 SQL 명령문을 작성
	2. 담당 교수 ID가 2인 강의의 강의명과 학점 수를 조회하는 SQL 명령문을 작성
	3. 2023년도 1학기에 수강하는 학생들의 목록을 조회하는 SQL 명령문을 작성 (학생 ID와 이름을 포함)
*/ 

select std_name, entrance_year
from `students`
where std_major = 'Computer Science';

select cour_name, credit
from `courses`
where cour_pro_id = 2;

select S.std_id, S.std_name
from `students` S
	join `Enrollments` E
    on S.std_id = E.std_id
where term = 1 and enr_year = '2023';

select * from Enrollments;