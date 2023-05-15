proc sql;

/* subquery example */
/* step 1 */
select distinct sex, avg(height) as AVG_HGHT
	from sashelp.class
	group by sex;
	
/* 이 방법으로 진행 */
select avg(height) as AVG_HGHT
	from sashelp.class
	where sex = 'F';
	
/* step 2 */
create table tmp as
	select *, avg(height) as AVG_HGHT
	from sashelp.class
	where sex = 'F';
	
select * from tmp;

/* 오류 */
/* select * */
/* 	from sashelp.class */
/* 	where height < tmp.avg_hght; */

/* 한번에 가능 */
select *
	from sashelp.class
	having height < /* where도 사용 가능 */
		(select avg(height) as AVG_HGHT
		from sashelp.class
		where sex = 'F');


/* 예제 */
select *
	from sashelp.class
	where height >
		(select min(height) as MIN_HGHT
		from sashelp.class
		where sex = 'M')
		and sex = 'F';
		
		
/* 다중행 서브쿼리 */
select name
	from sashelp.classfit
	where predict < 100;
	
select *
	from sashelp.class
	where name in
		(select name
		from sashelp.classfit
		where predict < 100);
		
		
/* 다중열 서브쿼리 */
select name, age
	from sashelp.classfit
	where predict < 100;
	
/* 오류 */
/* select * */
/* 	from sashelp.class */
/* 	where name, age in */
/* 		(select name, age */
/* 		from sashelp.classfit */
/* 		where predict < 100); */

/* Non-pairwise => 원하는 결과가 아님 */
select *
	from sashelp.class as a
	where a.name in
		(select b.name
		from sashelp.classfit as b
		where b.predict < 100)
	and a.age in
		(select b.age
		from sashelp.classfit as b
		where b.predict < 100);

/* pairwise => 오류 */
/* SELECT * */
/* 	FROM SASHELP.CLASS AS A */
/* 	WHERE (A.NAME, A.AGE) IN */
/* 		(SELECT NAME, AGE */
/* 		FROM SASHELP.CLASSFIT AS B */
/* 		WHERE B.PREDICT < 100); */


/* 간단한 데이터로 확인 */
CREATE TABLE T1 (ID CHAR(3), AGE NUM);
INSERT INTO T1 VALUES("A1",10) VALUES("A2",20);

CREATE TABLE T2 (ID CHAR(3), AGE NUM);
INSERT INTO T2
	VALUES("A1",5) VALUES("A1",10)
	VALUES("A2",10) VALUES("A2",15)
	VALUES("A3",20);

select * from t1;
select * from t2;

/* 오류 */
/* SELECT * */
/* 	FROM T1 */
/* 	WHERE (ID, AGE) IN (SELECT ID, AGE FROM T2); */

/* 오류 */
/* SELECT * */
/* 	FROM T1 */
/* 	WHERE (SELECT ID, AGE FROM T1) */
/* 	IN (SELECT ID, AGE FROM T2); */

/* 실행은 되지만 원하는 결과가 아님 */
SELECT *
	FROM T1
	WHERE ID IN (SELECT ID FROM T2)
	AND AGE IN (SELECT AGE FROM T2);

/* 마찬가지로 실행은 됨(만족하는 행은 없음) */
SELECT *
	FROM T1
	WHERE ID IN (SELECT ID FROM T2 WHERE ID = "A2")
	AND AGE IN (SELECT AGE FROM T2 WHERE ID = "A2");


/* 연관 서브쿼리 */
select avg(height) as AVG_HGHT
	from sashelp.classfit
	group by sex;
	
select name, sex, height
	from sashelp.class as a
	where a.height >
		(select avg(height) as AVG_HGHT
		from sashelp.classfit as b
		group by sex
		having a.sex = b.sex);

/* another method :: join */
select a.name, a.sex, a.height
	from sashelp.class as a
	inner join
		(select *
		from sashelp.classfit
		group by sex
		having height > avg(height)) as b
	on a.name = b.name;
	
select a.name, a.sex, a.height
	from sashelp.class as a
	left join
		(select *
		from sashelp.classfit
		group by sex
		having height > avg(height)) as b
	on a.name = b.name
	where b.name is not null;
	

/* exists */
select *
	from sashelp.class as a
	where exists
		(select height
		from sashelp.classfit as b
		having min(b.height) >= a.height);

/* any */
select * from sashelp.class
	where name = any
		(select name
		from sashelp.classfit
		where predict < 100);
		
/* all */
select * from sashelp.class
	where name = all
		(select name
		from sashelp.classfit
		where predict < 100);
		
CREATE TABLE T1 (C1 NUM); CREATE TABLE T2 (C2 NUM);
INSERT INTO T1 VALUES(1) VALUES(2) VALUES(15) VALUES(40);
INSERT INTO T2 VALUES(10) VALUES(20) VALUES(30);

SELECT * FROM T1
	WHERE C1 > ALL (SELECT C2 FROM T2);


/* view */
create table t as
	select name, age from sashelp.class;

create table v1 as
	select name, age from sashelp.class;
	
select * from t;
select * from v1;

create table a as
	select * from sashelp.class;
	
create table t as
	select name, age from a;

create view v2 as
	select name, age from a;
	
select * from a;
select * from t;
select * from v2;

insert into a (name)
	values ('KIM')
	values ('LEE')
	values ('PARK');
	
select * from t;
select * from v2;


/* data step view를 sql에서 사용 가능 / 반대로도 가능 */
data data_v / view = data_v;
	set a;
run;

proc sql; select * from data_v;

create view sql_v as
	select * from a;

proc print data = sql_v; run;


/* 과제 title 설명 */
title1 title111;
title2 title222;
select * from sashelp.class;

title2 title333;
select * from sashelp.class;

title1; /* reset */
select * from sashelp.class;