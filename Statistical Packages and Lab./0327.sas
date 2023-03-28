data dept1;
input ssn $ name $ hired date7. salary @@;
format hired date7.;
cards;
2393 Martin 09aug80 34800
;
run;

proc print data = dept1;
title dept1;
run;


data dept2;
input ssn $ name $ hired date7. salary @@;
format hired date7.;
cards;
1203 Sayre 15nov84 44800
;
run;

proc print data = dept2;
title dept2;
run;


data randd;
length dept $ 10 manager $ 10;
input project $ dept $ manager $ headcoun;
cards;
MP971 Designing Daugherty 10
SL827 Coding Newton 8
MP971 Testing Miller 7
;
run;

proc print data = randd;
title randd;
run;


data pubs;
length manager $ 10;
input manager $ headcoun project $ wage;
cards;
Daugherty 10 MP971 5
Slivko 10 WP057 5
Newton 8 SL827 4
;
run;

proc print data = pubs;
title pubs;
run;


/* merge */
data randdpubs_merge1;
merge randd pubs;
run;

proc print data = randdpubs_merge1;
title randdpubs_merge1;
run;


/* errer */
/* data randdpubs_merge2;
merge randd pubs;
by manager;
run;

proc print data = randdpubs_merge2;
title randdpubs_merge2;
run; */


/* sort 후에 merge */
proc sort data = randd out = randd_sort;
by project;
run;

proc print data = randd_sort;
title randd_sort;
run;


proc sort data = pubs out = pubs_sort;
by project;
run;

proc print data = pubs_sort;
title pubs_sort;
run;


data randdpubs_merge3;
merge randd_sort pubs_sort;
by manager;
run;

proc print data = randdpubs_merge3;
title randdpubs_merge3;
run;


/* append */
proc append base = dept1 data = dept2;
run;

/* 변수가 겹치기 때문에 실행이 이상 없음 */
proc print data = dept1;
title dept1;
run;

/* 로그 확인 */
/* proc append base = randd data = pubs;
run; */

/* 변수가 겹치는 경우에 써야 안전함 */
/* proc print data = randd;
title randd;
run; */


data randd_set;
set randd
randd (keep = manager)
randd (drop = dept)
randd (drop = project)
;
run;

proc print data = randd_set;
title randd_set;
run;


/* 변수 속성 */
data a;
length name $ 1;
input name $ @@;
cards;
K L P
;
run;

proc print data = a;
title a;
run;

data b;
length name $ 12;
input name $ @@;
cards;
IMKIMKIMKIMK EELEELEELEEL ARKPARKPARKP
;
run;

proc print data = b;
title b;
run;


data ab;
set a b;
run;

proc print data = ab;
title ab;
run;


data ba;
set b a;
run;

proc print data = ba;
title ba;
run;


/* updata */
proc print data = sashelp.class;
title class;
run;

proc sort data = sashelp.class out = class_my;
by name;
run;

proc print data = class_my;
title class_my;
run;


data new;
input name $ sex $ age height weight;
cards;
로날드 남 16 73.0 135.2
루이스 여 13 57.0 77.6
헨리에타 여 10 50.3 48.1
;
run;

proc print data = new;
title new;
run;

proc sort data = new;
by name;
run;

proc print data = new;
title new;
run;


data class_new;
update class_my new;
by name;
run;

proc print data = class_new;
title class_new;
run;


/* 변수 생성 : 수식 예제 */
data class_bmi;
set sashelp.class;
bmi = 903 * weight / height ** 2;
diff = abs(weight - height);
run;

proc print data = class_bmi;
title class_bmi;
run;


/* 변수 생성 : 특정 조건 */
data class_bmi_edu;
set class_bmi;
if 8 <= age <= 13 then edu = age - 7;
else if 14 <= age <= 16 then edu = age - 13;
run;

proc print data = class_bmi_edu;
title class_bmi_edu;
run;


data class_bmi_shape;
set class_bmi;
if bmi < 18.5 then shape = 'Under';
else if bmi < 25 then shape = 'Normal';
else shape = 'Over';
run;

proc print data = class_bmi_shape;
title class_bmi_shape;
run;


/* 기존 변수 수정 */
data class_bmi;
set class_bmi;
bmi = 703 * weight / height ** 2;
run;

proc print data = class_bmi;
title class_bmi;
run;

data class_bmi;
set class_bmi;
bmi = bmi / 903 * 703;
run;

proc print data = class_bmi;
title class_bmi;
run;


/* 특정 관찰값 남기기 */
data class_bmi_1;
set class_bmi;
if name = 'Alfred';
run;

proc print data = class_bmi_1;
title class_bmi_1;
run;


/* 특정 관찰값 삭제 */
data class_bmi_2;
set class_bmi;
if name = 'Alfred' then delete;
run;

proc print data = class_bmi_2;
title class_bmi_2;
run;


/* 문자형 데이터 */
data class_bmi_ro;
set class_bmi;
if substr(name, 1, 2) = 'Ro';
run;

proc print data = class_bmi_ro;
title class_bmi_ro;
run;


data class_bmi_ro_1;
set class_bmi;
if substr(name, 1, 2) = 'Ro' then delete;
run;

proc print data = class_bmi_ro_1;
title class_bmi_ro_1;
run;


/* "J"로 시작하는 데이터만 */
data class_bmi_ro_2;
set class_bmi;
if substr(name, 1, 1) = 'J';
run;

proc print data = class_bmi_ro_2;
title class_bmi_ro_2;
run;


/* "J"로 시작하지 않는 데이터만 */
data class_bmi_bonus;
set class_bmi;
if substr(name, 1, 1) ^= 'J';
run;

proc print data = class_bmi_bonus;
title class_bmi_bonus;
run;