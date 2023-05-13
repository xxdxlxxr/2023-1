proc sql;

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
	

/* set과 merge */
data tmp;
set randd pubs;
run;

proc print data = tmp; run;

data tmp;
merge randd pubs;
run;

proc print data = tmp; run;


/* set문 by 있고 없고 차이 */
proc sort data = randd; by manager; run;
proc sort data = pubs; by manager; run;

data tmp;
	set randd pubs;
	run;

proc print data = tmp; title set; run;

data tmp;
	set randd pubs;
	by manager;
	run;

proc print data = tmp; title set; run;


/* merge문 by 있고 없고 차이 */
data tmp;
	merge randd pubs;
	run;

proc print data = tmp; title merge; run;

data tmp;
	merge randd pubs;
	by manager;
	run;

proc print data = tmp; title merge; run;


/* full outer join과 merge */
proc sql;

SELECT COALESCE(A.manager, B.manager) AS manager,
	COALESCE(A.headcoun, B.headcoun) AS headcoun,
	COALESCE(A.project, B.project) AS project,
	A.dept, B.wage
	FROM randd AS A FULL OUTER JOIN pubs AS B
	ON A.manager = B.manager;

DATA tmp; MERGE randd pubs;
	BY manager; RUN; /*SAME variable name*/

PROC PRINT DATA =tmp;
	TITLE MERGE (DATA step); RUN; TITLE;


/* 데이터 변경 */
proc sql;

CREATE TABLE randd2(
	manager CHAR(9), headcoun NUM,
	project CHAR(5), dept CHAR(9));

INSERT INTO randd2
	VALUES ("Daugherty", 10, "MP971", "Designing")
	VALUES ("Daugherty", 10, "MP971", "Design")
	VALUES ("Newton", 8, "SL827", "Coding")
	VALUES ("Miller", 7, "MP971", "Testing");

CREATE TABLE pubs2(
	manager CHAR(9), headcoun NUM,
	project CHAR(5), wage NUM);

INSERT INTO pubs2
	VALUES ("Daugherty", 10, "MP971", 5)
	VALUES ("Daugherty", 10, "MP971", 52)
	VALUES ("Silvko", 10, "WP057", 5)
	VALUES ("Newton", 8, "SL827", 4);
	
	
TITLE "FULL OUTER JOIN (2)";
	SELECT
	COALESCE(A.manager, B.manager) AS manager,
	COALESCE(A.headcoun, B.headcoun) AS headcoun,
	COALESCE(A.project, B.project) AS project,
	A.dept,
	B.wage
	FROM randd2 AS A FULL OUTER JOIN pubs2 AS B
	ON A.manager = B.manager;

DATA tmp;
	MERGE randd2 pubs2; RUN;
	
PROC PRINT DATA =tmp;
	TITLE "MERGE (2) (DATA step)" ; RUN; TITLE;


/* 3개 이상 join */
proc sql;

select * from sashelp.macrs3;
select * from sashelp.macrs5;
select * from sashelp.macrs7;

SELECT COALESCE(A.YEAR, B.YEAR, C.YEAR), *
	FROM SASHELP.MACRS3 AS A
		FULL OUTER JOIN SASHELP.MACRS5 AS B
			ON A.YEAR = B.YEAR
		FULL OUTER JOIN SASHELP.MACRS7 AS C
			ON COALESCE(A.YEAR, B.YEAR) = C.YEAR;
			

/* join 없이 붙이기 */
select * from randd, pubs;

select * from randd, pubs
	where (randd.project = pubs.project)
	and (randd.manager ^= pubs.manager);
	

/* union : 중복 제거해서 병합한 후 정렬 */
SELECT manager FROM randd
UNION
SELECT manager FROM pubs;

/* union all : 정렬한 후 위아래 병합 */
SELECT manager FROM randd
UNION ALL
SELECT manager FROM pubs;

SELECT manager, project FROM randd
UNION
SELECT manager,project FROM pubs;

SELECT manager, project FROM randd
UNION ALL
SELECT manager, project FROM pubs;

SELECT manager, project FROM randd
UNION
SELECT project, manager FROM pubs;

SELECT manager, project FROM randd
UNION ALL
SELECT project, manager FROM pubs;

/* 변수의 순서에 따른 타입이 다름 => 오류 */
/* SELECT manager, project FROM randd */
/* UNION ALL */
/* SELECT project, wage FROM pubs; */

SELECT manager, headcoun FROM randd
UNION ALL
SELECT project, wage FROM pubs;