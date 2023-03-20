/*과제 풀이*/
/*data mydata;*/
/*input country : $12. tourtype : $12. nights landcost vendor $ @@;*/


data type;
input country $ tourtype $ nights landcost vendor $ @@;
cards;
Spain architecture 10 510 World Japan architecture 8 720 Express
Switzerland scenery 9 734 World France architecture 8 575 World
Ireland scenery 7 558 Express NewZealnad scenery 16 1489 Southsea
Italy architecture 8 468 Express Greece scenery 12 698 Express
Korea architecture 5 456 Express
;
run;

proc print data = type;
title type;
run;


/*proc sort 예제1*/
proc sort data = type out = type_sort_ctry;
by country;
run;

proc print data = type_sort_ctry;
title type_sort ctry;
run;


/*proc sort 예제2*/
proc sort data = type out = type_sort_ldcst;
by landcost;
run;

proc print data = type_sort_ldcst;
title type_sort_ldcst;
run;


/*proc sort 내림차순 예제1*/
proc sort data = type out = type_sort_ctry_d;
by descending country;
run;

proc print data = type_sort_ctry_d;
title type_sort ctry_d;
run;


/*proc sort 내림차순 예제2*/
proc sort data = type out = type_sort_ldcst_d;
by descending landcost;
run;

proc print data = type_sort_ldcst_d;
title type_sort_ldcst_d;
run;


/*more than one variable 둘 다 오름차순*/
proc sort data = type out = type_sort_trtp_nght;
by tourtype nights;
run;

proc print data = type_sort_trtp_nght;
title type_sort_trtp_nght;
run;


/*하나는 오름차순 하나는 내림차순*/
proc sort data = type out = type_sort;
by tourtype descending nights;
run;

proc print data = type_sort;
title type_sort;
run;


/*more than one variable 둘 다 내림차순*/
proc sort data = type out = type_sort_trtp_nght_d;
by descending tourtype descending nights;
run;

proc print data = type_sort_trtp_nght_d;
title type_sort_trtp_nght_d;
run;


/*대소문자 정렬*/
data type_capital;
input country $ tourtype $ nights landcost vendor $ @@;
cards;
Spain Architecture 10 510 World Japan architecture 8 720 Express
Switzerland Scenery 9 734 World France architecture 8 575 World
Ireland Scenery 7 558 Express NewZealnad scenery 16 1489 Southsea
Italy Architecture 8 468 Express Greece scenery 12 698 Express
Korea Architecture 5 456 Express
;
run;

proc sort data = type_capital out = type_sort;
by tourtype;
run;

proc print data = type_sort;
title type_sort;
run;


data type;
input country $ tourtype $ nights landcost vendor $ @@;
cards;
Spain architecture 10 510 World Japan architecture 8 720 Express
Switzerland scenery 9 734 World Switzerland scenery 9 734 World
Switzerland scenery 9 734 World France architecture 8 575 World
Ireland scenery 7 558 Express NewZealnad scenery 16 1489 Southsea
Italy architecture 8 468 Express Greece scenery 12 698 Express
Korea architecture 5 456 Express
;
run;

/*nodupkey*/
proc sort data = type out = type_sort1 nodupkey;
by tourtype;
run;

proc print data = type_sort1;
title type_sort1;
run;


/*nodup*/
proc sort data = type out = type_sort2 nodup;
by tourtype;
run;

proc print data = type_sort2;
title type_sort2;
run;


/*first/last(sort 먼저)*/
proc sort data = type out = type_sort3;
by tourtype landcost;
run;

proc print data = type_sort3;
title type_sort3;
run;

data type_sort_opt;
set type_sort3;
by tourtype;
tour_first = first.tourtype;
tour_last = last.tourtype;
run;

proc print data = type_sort_opt;
title type_sort_opt;
run;
