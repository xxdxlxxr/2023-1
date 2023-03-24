/*내장 데이터*/
proc print data = sashelp.baseball;
run;

proc contents data = sashelp.baseball;
run;


/*set문 keep*/
data mybaseball_1;
set sashelp.baseball (keep = name);
run;

proc print data = mybaseball_1;
title 'mybaseball_1';
run;


data mybaseball_2;
set sashelp.baseball (keep = name team position);
run;

proc print data = mybaseball_2;
title 'mybaseball_2';
run;


/*set문 drop*/
data mybaseball_3;
set sashelp.baseball (drop = crhits);
run;

proc print data = mybaseball_3;
title 'mybaseball_3';
run;


data mybaseball_4;
set sashelp.baseball (drop = crhits nrbi);
run;

proc print data = mybaseball_4;
title 'mybaseball_4';
run;


/*firstobs : k번째 줄부터 사용하고자 할 때 사용*/
proc print data = sashelp.macrs20;
title 'macrs20';
run;


data mymacrs_1;
set sashelp.macrs20 (firstobs = 5);
run;

proc print data = mymacrs_1;
title 'mymacrs_1';
run;


data mymacrs_2;
set sashelp.macrs20 (firstobs = 12);
run;

proc print data = mymacrs_2;
title 'mymacrs_2';
run;


/*trial*/
data mybaseball_1;
set sashelp.baseball (keep = name team natbat nhits);
run;

proc print data = mybaseball_1;
title 'mybaseball_1';
run;


data mybaseball_2;
set sashelp.baseball (drop = name team natbat nhits);
run;

proc print data = mybaseball_2;
title 'mybaseball_2';
run;


/*trial2*/
data mybaseball_1 (keep = name team natbat nhits)
mybaseball_2 (drop = name team nhome nruns nrbi nbb);
set sashelp.baseball;
run;

proc print data = mybaseball_1;
title 'mybaseball_1';
run;

proc print data = mybaseball_2;
title 'mybaseball_2';
run;


data mybaseball_1 (keep = name);
set sashelp.baseball;
run;

proc print data = mybaseball_1;
title 'mybaseball_1';
run;


/*데이터 병합(dollars input 줄의 salary에도 넣어보고 format에도 넣어보기)*/
data dept1;
input ssn $ name $ hired data7. salary @@;
format hired data7.;
cards;
2393 Martin 09aug80 34800
;
run;

proc print data = dept1;
title dept1;
run;


data dept2;
input ssn $ name $ hired data7. salary @@;
format hired data7.;
cards;
1203 Sayre 15nov84 44800
;
run;

proc print data = dept2;
title dept2;
run;


data dept12;
set dept1 dept2;
run;

proc print data = dept12;
title dept12;
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


data randdpubs_set1;
set randd pubs;
run;

proc print data = randdpubs_set1;
title randdpubs_set1;
run;


data randdpubs_set2;
set randd pubs;
by project;

proc print data = randdpubs_set2;
title randdpubs_set2;
run;


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


data randdpubs_set3;
set randd_sort pubs_sort;
by project;

proc print data = randdpubs_set3;
title randdpubs_set3;
run;
