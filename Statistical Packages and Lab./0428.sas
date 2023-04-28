proc sql;


select *, length1 + length2 as SUMLENGTH12
	from sashelp.fish;


/* 빈 column 생성(오류) */
/* select *, MYCOL */
/* 	from sashelp.fish; */
	
/* 빈 column 생성 */
select *, . as MYCOL
	from sashelp.fish;


/* 다른 방법(내장 데이터라서 오류) */
/* alter table sashelp.fish */
/* 	add mycol num; */

create table MYFISH as
	select *
	from sashelp.fish;
	
alter table myfish
	add MYCOL num;
	
select * from myfish;


/* 결측치 찾기(where문 활용) */
select * from sashelp.fish
	where weight = .;
	
	
/* 결측치 제외 */
select * from sashelp.fish
	where weight ^= .;
	
	
/* 결측치 탐색 */
select * from sashelp.fish
	where weight is null;
	
	
/* 결측치 제외 */
select * from sashelp.fish
	where weight is not null;
	
	
/* 값 갱신(내장 데이터라서 오류) */
/* update sashelp.class */
/* 	set age = 15; */


/* 값 갱신 */
create table MYCLASS as
	select * from sashelp.class;
	
update myclass
	set age = 15;
	
select * from sashelp.class;
select * from myclass;


create table MYCLASS_2 as
	select * from sashelp.class;

update myclass_2
	set age = 15
	where sex = 'M';

select * from sashelp.class;
select * from myclass_2;


/* 잘려서 갱신됨 */
/* create table MYCLASS_3 as */
/* 	select * from sashelp.class; */
/*  */
/* update myclass_3 */
/* 	set sex = 'male' */
/* 	where sex = 'M'; */
/*  */
/* select * from sashelp.class; */
/* select * from myclass_3; */


/* case문 */
select
	case
		when sex = 'M' then 'Male'
	end
from sashelp.class;


/* case문(변수명 지정) */
select
	case
		when sex = 'M' then 'Male'
	end as sex2
from sashelp.class;


select
	case
		when sex = 'M' then 'Male'
		when sex = 'F' then 'Female'
	end as sex2
from sashelp.class;


/* case문(변수 위치 지정) */
select name,
	case
		when sex = 'M' then 'Male'
		when sex = 'F' then 'Female'
	end as sex2,
	age, height, weight
from sashelp.class;


/* 응용 */
select name,
	case
		when sex = 'M' then 'Male'
		when sex = 'F' then 'Female'
	end as sex2,
	age, height, weight,
	case
		when weight between 50 and 100 then 'check'
	end as WEIGHT_CHECK
from sashelp.class;


/* 문자 길이 */
select *,
	case
		when sex = 'M' then 'Male, Man'
		when sex = 'F' then 'Female, Woman'
	end as Sex_adj
from sashelp.class;


/* 변수의 설정된 문자 길이 확인(가장 긴 값의 길이를 기준) */
create table tmp as
	select *,
		case
			when sex = 'M' then 'Male, Man'
			when sex = 'F' then 'Female, Woman'
		end as Sex_adj
	from sashelp.class;
quit; /* 없어도 됨 */

proc contents data = tmp varnum; run;


/* 잘려서 나옴 */
/* proc sql; */
/*  */
/* create table tmp ( */
/* 	name char, */
/* 	misc char */
/* ); */
/*  */
/* insert into tmp */
/* 	 values ('Kim Minsu', 'missing;') */
/* 	 values ('Lee Chulsu', '') */
/* ; */
/*  */
/* proc contents data = tmp varnum; run; */
/* proc print data = tmp; run; */


/* 문자 길이 설정 */
proc sql;

create table tmp (
	name char(255),
	misc char(127)
);

insert into tmp
	 values ('Kim Minsu', 'missing;')
	 values ('Lee Chulsu', '')
;

proc contents data = tmp varnum; run;
proc print data = tmp; run;


/* like */
proc sql;

/* Ro로 시작하는 */
select * from sashelp.class
	where name like 'Ro%';
		
/* DATA STEP 방식으로도 가능 */
select * from sashelp.class
	where substr(name, 1, 2) = 'Ro';
		
/* 두번째가 a인 */
select * from sashelp.class
	where name like '_a%';