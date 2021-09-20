use master
go

create database Enrollmentsystem1
go

use Enrollmentsystem1
go

create table Student
(
	StudentID varchar(10) not null primary key,
	StudentName nvarchar (30) not null,
	StudentPhone int not null,
	StudentEmail varchar(30) null,
	StudentGender varchar(20) not null default('Male'),
	StudentAddress varchar(30) not null,
	Yearofbirth int not null
)
Go

alter table Student
add check (Yearofbirth  >= 1990 and Yearofbirth <=2001)
go

alter table Student
add unique (StudentPhone)

drop table register
drop table student

insert into Student (StudentID, StudentName, StudentPhone, StudentGender, StudentAddress, Yearofbirth) values
('ST1003', N'Hứa Trần Thụy Khanh', 0904444545, 'Female', 'Ho Chi Minh', 2001)
insert into Student (StudentID, StudentName, StudentPhone, StudentGender, StudentAddress, Yearofbirth) values
('ST1004', N'Nguyễn Thị Thúy',012769654, 'Female', 'Ha Noi', 1997)
insert into Student (StudentID, StudentName, StudentPhone, StudentGender, StudentAddress, Yearofbirth) values
('ST1005', N'Trần Ngọc Sương', 0764893656, 'Female', 'Ho Chi Minh', 2001)
insert into student (StudentID, StudentName, StudentPhone, StudentGender, StudentAddress, Yearofbirth) values
('ST1011', N'Dương Thoại Anh', 0785647845, 'Male','Can Tho', 1997)
go
insert into Student (StudentID, StudentName, StudentPhone, StudentAddress, Yearofbirth) values
('ST1006', N'Võ Nguyên Vũ', 0128764981, 'Da Nang', 1998)
insert into Student (StudentID, StudentName, StudentPhone, StudentAddress, Yearofbirth) values
('ST1007', N'Hứa Đình Phong', 0937774545, 'Da Nang', 1999),
('ST1008', N'Phan Hải Xuân', 0907693678, 'Hai Phong', 2000),
('ST1009', N'Trần Cao Vỹ', 0926784563, 'Ha Noi', 2000),
('ST1010', N'Nguyễn Văn Vũ', 0126745678, 'Can Tho', 2001)
go

update Student
set StudentEmail ='ngocnguyen2405@gmail.com'
where StudentID='ST1001'	

delete from Student
where StudentID = 'ST1011'
go

update Student
set StudentEmail ='vonguyenvu1998@gmail.com'
where StudentID='ST1006'	

select Student.StudentID, Student.StudentName, Student.StudentAddress from Student 
where StudentAddress not in ('Ho Chi Minh')

select Student.StudentID, Student.StudentName, Student.Yearofbirth from Student 
where year(Getdate()) - Student.Yearofbirth <21

select * from Student
where StudentName like N'Nguyễn%'

select* from Student
go

select StudentGender, count(*) as TotalGender from Student
where StudentGender='Male' or StudentGender='Female'
group by StudentGender


create table Semester
(
	SemesterID varchar(10) not null primary key,
	SemesterYear int not null check (SemesterYear>=2015 and SemesterYear<=2020) 
)
go

alter table Semester
add check (SemesterYear  >= 2015 and SemesterYear <=2020)
go

insert into Semester values
('SM151', 2015),
('SM152', 2015),
('SM161', 2016),
('SM162', 2016)
insert into Semester values
('SM171', 2017),
('SM172', 2017)
insert into Semester values
('SM181', 2018),
('SM182', 2018),
('SM191', 2019),
('SM192', 2019)
go

select* from semester
go


create table Teacher
(
	TeacherID varchar(10) not null primary key,
	TeacherName nvarchar (30) not null
)
Go

insert into Teacher values
('T100', N'Nguyễn Hữu Phước')
go
insert into Teacher values
('T150', N'Nguyễn Phan Thành'),
('T200', N'Phan Trung Nguyên'),
('T250', N'Nguyễn Phi An'),
('T300', N'Nguyễn Ngọc Quỳnh Anh'),
('T350', N'Trần Văn Khoa'),
('T400', N'Đỗ Gia Bách'),
('T450', N'Phạm Trần Phúc'),
('T500', N'Chu Hà Minh'),
('T550', N'Đào Ngọc Hà'),
('T600', N'Nguyễn Quang Vinh'),
('T650', N'Lê Thu Anh')
go

select* from Teacher
go

create table Room
(
	RoomNo int identity(1,1) primary key,
	RoomType varchar(20) not null
)
Go
insert into Room (Roomtype) values
('Classroom'),
('Laboratory'),
('Computer room')
insert into Room (Roomtype) values
('Classroom'),
('Music Room'),
('Library'),
('Classroom')
go
insert into Room (Roomtype) values
('Art room'),
('Laboratory'),
('Classroom'),
('Laboratory'),
('Computer room'),
('Classroom')
go
insert into Room (Roomtype) values
('Classroom'),
('Computer Room')



create table Course
(
	CourseID varchar(10) not null primary key,
	CourseName varchar(30) not null,
	TeacherID varchar(10) not null,
	RoomNo int not null,
	CourseSchedule varchar(30) null,
	CourseType varchar (10) not null,
	constraint fk_teacherid foreign key (TeacherID) references Teacher (TeacherID),
	constraint fk_roomNo foreign key (RoomNo)  references Room (RoomNo)
)
Go
alter table Course 
add constraint df_coursetype default 'Standard' 
for Coursetype
go 

alter table Course
add CourseRequirement varchar(50) null

insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule) values
('CO10', 'Music', 'T100',5, 'Monday')
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule) values
('CO20', 'Art', 'T150', 8, 'Friday'),
('CO30', 'Programing', 'T200',3, 'Monday and Saturday'),
('CO40', 'Accounting', 'T100',12, 'Wednesday and Thursday')
go
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule) values
('CO50', 'Finance', 'T250',1, 'Tuesday'),
('CO60', 'History', 'T300', 8, 'Wednesday and Saturday'),
('CO70', 'Science', 'T350',3, 'Monday'),
('CO80', 'Business studies', 'T400',12, 'Monday, Thursday, Friday'),
('CO90', 'Drama', 'T100',5, 'Tuesday')
--insert online and hybrid class
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule, CourseType) values
('CO100', 'Geography', 'T500', 4, 'All week', 'Hybrid'),
('CO110', 'Citizenship', 'T300',7, 'Monday', 'Hybrid'),
('CO120', 'Biology', 'T600',11, 'Monday and Saturday', 'Hybrid')
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule, CourseType) values
('CO130', 'Mathematics','T200',3,  'All week', 'Online')
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule, CourseType) values
('CO140', 'Modern studies', 'T250',5, 'Friday', 'Online')
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule, CourseType) values
('CO150', 'English', 'T450',4, 'Saturday','Online')
insert into Course (CourseID, CourseName, TeacherID, RoomNo, CourseSchedule, CourseType) values
('CO160', 'Soft skill', 'T550',15, 'Thursday and Wednesday', 'Online')

update Course
set CourseRequirement='Bring instrument'
where CourseName='Music'

update Course
set CourseRequirement = 'Bring book'
where TeacherID='T100'

update Course
set CourseRequirement ='Buy studying app'
where CourseType='Online' or CourseType='Hybrid'

update Course
set CourseName='Mathematics'
where CourseID='CO160'

select CourseType, count(*) as Totalcourse from Course
where CourseType='Online' or CourseType='Standard' or CourseType='Hybrid'
group by CourseType


select Course.TeacherID, Course.CourseID
from Course
where TeacherID='T100' 

select TeacherID, count(*) as TotalCourse
from Course
group by TeacherID  
go     

select* from course
go


create table Register
(
	CourseID varchar(10) not null,
	StudentID varchar(10) not null,
	SemesterID varchar(10) not null,
	LoginUserName varchar(20) not null,
	constraint pk_register primary key ( CourseID, StudentID, SemesterID),
	constraint fk_courseid foreign key (CourseID) references Course (CourseID),
	constraint fk_studentid foreign key (StudentID) references Student (StudentID),
	constraint fk_semesterid foreign key (SemesterID) references Semester (SemesterID)
)
Go

alter table Register
drop column LoginUserName

--course 2017
insert into Register values
('CO10', 'ST1001', 'SM171'),
('CO10', 'ST1002', 'SM171')
go
--course 2018
insert into Register values
('CO20', 'ST1003', 'SM181'),
('CO20', 'ST1004', 'SM181'),
('CO30', 'ST1005', 'SM182'),
('CO30', 'ST1006', 'SM182'),
('CO40', 'ST1007', 'SM181'),
('CO40', 'ST1008', 'SM181')
--course 2019
insert into Register values
('CO50', 'ST1006', 'SM171'),
('CO50', 'ST1007', 'SM171'),
('CO60', 'ST1008', 'SM172'),
('CO60', 'ST1009', 'SM172'),
('CO60', 'ST1010', 'SM172')
--course 2017
insert into Register values
('CO70', 'ST1007', 'SM171'),
('CO80', 'ST1008', 'SM171'),
('CO80', 'ST1003', 'SM172'),
('CO90', 'ST1010', 'SM172'),
('CO90', 'ST1006', 'SM172')
--course2015
insert into Register values
('CO100', 'ST1003', 'SM151'),
('CO100', 'ST1004', 'SM151'),
('CO110', 'ST1001', 'SM152'),
('CO110', 'ST1002', 'SM152'),
('CO120', 'ST1007', 'SM152'),
('CO120', 'ST1008', 'SM152')



select t.TeacherID, t.TeacherName, r.RoomNo,c.CourseName from Teacher t
join Course c
on t.TeacherID= c.TeacherID
join room r
on r.RoomNo=c.RoomNo
go


create view StudentRegister
as
select s.studentiD, s.studentName, re.courseID
from student s
join register re
on s.studentid=re.studentid

select* from register
go
  