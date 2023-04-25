/* linkname 8바이트 이하로 설정 */


proc sql;

create table CLUB (
	id num,
	name char,
	team char,
	strtwght num,
	endwght num
	)
;

insert into club
	values (1023, 'David', 'red', 189, 165)
	values (1049, 'Amelia', 'yellow', 145, 124)
;

insert into club
	set id = 1219, name = 'Alan', team = 'red', strtwght = 21
;

select *
	from club; /* * : 변수 전체 */

select id, name, team
	from club;

create table club1 as
	select id, name, team
		from club;
		
select *
	from club1;
	
	
/* 실습 예제 */
create table STUDY (
	name char,
	class char,
	age num,
	score1 num,
	score2 num
	)
;

insert into study
	values ('Kim', 'B', 18, 55, 60)
	values ('CHOI', 'B', 17, ., 70)
;

insert into study
	set name = 'LEE', class = 'C', age = 18, score1 = 70, score2 = 75
	set name = 'KIM', class = 'C', age = 18, score2 = 65
;

select *
	from study;
	
	
/* 변수 추가 */
select *, (strtwght + endwght) / 2
	from club;

select *, (strtwght + endwght) / 2 as avgwhgt
	from club;

select (strtwght + endwght) / 2 as avgwght, *
	from club;
	
select id, name, (strtwght + endwght) / 2 as avgwght, team, strtwght, endwght
	from club;
	

/* 실습 예제 */
create table STUDY1 as
	select *, sum(score1, score2) as scoresum
	from study;

select *
	from study1;

create table STUDY2 as
	select sum(score1, score2) as scoresum, *
	from study;

select *
	from study2;
	
create table STUDY3 as
	select name, sum(score1, score2) as scoresum, class, age, score1, score2
	from study;
	
select *
	from study3;
	
/* + 대신 sum() 함수를 쓰면 결측치 포함해서 합계 계산 가능 */


/* 조건에 의한 자료 선택 */
select *
	from club
	where team = 'red';
	

/* 비교연산자, 논리연산자 */
select *
	from sashelp.class
	where sex in ('FEMALE', 'F') and height between 50 and 60;
	
select *
	from sashelp.class
	where not (sex in ('FEMALE', 'F') or height between 50 and 60);
	
	
/* 정렬 */
select * from sashelp.class
	order by sex;
	
select * from sashelp.class
	order by sex asc;
	
select * from sashelp.class
	order by sex desc;
	
select * from sashelp.class
	order by sex, name;
	
select * from sashelp.class
	order by sex, name desc;
	
select * from sashelp.class
	order by sex desc, name desc;
	
	
/* 실습 예제 */
create table MYCARS as
	select make, type, drivetrain, invoice
	from sashelp.cars
	where make = 'Acura' and drivetrain = 'Front';

select * from mycars
	order by invoice desc;