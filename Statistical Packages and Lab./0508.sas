proc sql;

/* 평균 산출 */
select avg(age)
	from sashelp.class;
	
/* 한 변수의 여러 통계량 산출 */
select min(age), median(age), max(age), avg(age), std(age), var(age)
	from sashelp.class;
	
/* 여러 변수의 각각 다른 통계량 산출 */
select min(age), median(weight), max(height)
	from sashelp.class;
	
/* 구분 */
select min(age) as MIN_AGE,
median(weight) as MED_WGHT,
max(height) as MAX_HGHT
from sashelp.class;


/* 예제 */
select nmiss(weight) as NMISS_WGHT,
range(width) as RANGE_WIDTH
from sashelp.fish;


/* column 내에 한 번 이상 나오는 값들의 리스트 산출 */
select distinct sex
from sashelp.class;

select distinct age
from sashelp.class;

select *
	from sashelp.class
	order by sex, age;

select distinct sex, age
from sashelp.class;


/* 어느 column 내에 총 몇가지의 값이 나오는지 확인 */
select count(distinct sex)
	from sashelp.class;
	
select count(distinct age)
	from sashelp.class;
	
/* 오류 */
/* select count(distinct sex, age) */
/* 	from sashelp.class; */


/* column 내 각 값이 몇 번 나오는지 확인 */
select count(sex)
	from sashelp.class;
	
select count(sex)
	from sashelp.class
	group by sex;
	
select distinct sex, count(sex)
	from sashelp.class
	group by sex;
	
select distinct sex, count(sex) as CNT_SEX
	from sashelp.class
	group by sex;
	
select distinct sex, count(sex) as CNT_SEX, nmiss(sex) as NMISS_SEX
	from sashelp.class
	group by sex;
	
	
/* 통계량 구하기 group */
select count(age)
	from sashelp.class
	group by sex, age;
	
select distinct sex, age, count(age) as N
	from sashelp.class
	group by sex, age;
	

/* 그룹별로 변수의 통계량 구하기 */
select mean(height)
	from sashelp.class
	group by sex;
	
select distinct sex, mean(height) as AGE_WGHT
	from sashelp.class
	group by sex;
	
select distinct age, mean(weight) as MEAN_WGHT
	from sashelp.class
	group by age;


/* 조건부 통계량 구하기 */
select distinct age, mean(weight) as MEAN_WGHT_MALE
	from sashelp.class
	where sex = 'M'
	group by age;
	

/* 통계량 필터링 */
/* 오류 */
/* select distinct age, mean(weight) */
/* 	from sashelp.class */
/* 	where mean(weight) > 100 */
/* 	group by age; */

/* having문은 제일 마지막 줄에 */
select distinct age, mean(weight) as MEAN_WGHT_100
	from sashelp.class
	group by age
	having mean(weight) > 100;


select distinct age, mean(weight) as MEAN_WGHT_100
	from sashelp.class
	where sex = 'M'
	group by age
	having mean(weight) > 100;
	
	
/* join */
CREATE TABLE randd(
	manager CHAR(9), headcoun NUM,
	project CHAR(5), dept CHAR(9));

INSERT INTO randd
	VALUES ("Daugherty", 10, "MP971", "Designing")
	VALUES ("Newton", 8, "SL827", "Coding")
	VALUES ("Miller", 7, "MP971", "Testing");

CREATE TABLE pubs(
	manager CHAR(9), headcoun NUM,
	project CHAR(5), wage NUM);

INSERT INTO pubs
	VALUES ("Daugherty", 10, "MP971", 5)
	VALUES ("Silvko", 10, "WP057", 5)
	VALUES ("Newton", 8, "SL827", 4);


/* inner join	 */
select *
	from randd inner join pubs
	on randd.manager = pubs.manager;
	
/* 오류 */
/* select manager, project, headcoun, dept, wage */
/* 	from randd inner join pubs */
/* 	on randd.manager = pubs.manager; */

select randd.manager, randd.project, randd.headcoun, randd.dept, pubs.wage
	from randd inner join pubs
	on randd.manager = pubs.manager;
	
/* rename */
select a.manager, a.project, a.headcoun, a.dept, b.wage
	from randd as a inner join pubs as b
	on a.manager = b.manager;
	

/* left join */
select *
	from randd left join pubs
	on randd.manager = pubs.manager;
	
select a.manager, a.project, a.headcoun, a.dept, b.wage
	from randd as a left join pubs as b
	on a.manager = b.manager;
	

/* right join */
select b.manager, b.project, b.headcoun, a.dept, b.wage
	from randd as a right join pubs as b
	on a.manager = b.manager;
	

/* full join */
select b.manager, b.project, b.headcoun, a.dept, b.wage
	from randd as a full outer join pubs as b
	on a.manager = b.manager;
	
	
select coalesce(a.manager, b.manager) as j_manager,
	coalesce(a.project, b.project) as j_project,
	a.dept,
	coalesce(a.headcoun, b.headcoun) as j_headcoun,
	b.wage
	from randd as a full outer join pubs as b
	on a.manager = b.manager;