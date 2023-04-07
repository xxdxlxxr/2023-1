data mydata;
	length A $ 1.;
	set sashelp.bmimen;
	A = '..';
run;

proc print data = mydata; title mydata; run;


data mydata;
	set sashelp.bmimen;
	A = '..';
run;

proc print data = mydata; title mydata; run;


/* 코드는 위에서 아래로 하나씩 실행됨 */
data mydata;
	set sashelp.bmimen;
	A = '..';
	if age = 2.1 then B = age + bmi;
run;

proc print data = mydata; title mydata; run;


data my_revhub;
	set sashelp.revhub2;
	cum_rev + revenue;
run;

proc print data = my_revhub; title my_revhub; run;


/* 합계만 필요 */
proc print data = my_revhub (firstobs = 72); title my_revhub; run;

proc print data = my_revhub (firstobs = 72); title my_revhub; var cum_rev; run;

data my_revhub;
	set sashelp.revhub2;
	cum_rev + revenue;
	MYOBS + 1;
	if myobs = 72;
run;

proc print data = my_revhub; title my_revhub; run;


/* end를 이용 */
data my_revhub;
	set sashelp.revhub2 end = lastobs;
	CUM_REV + revenue;
	tmp_lastobs = lastobs;
	if tmp_lastobs;
run;

proc print data = my_revhub; title my_revhub; run;

data my_revhub (keep = cum_rev);
	set sashelp.revhub2 end = lastobs;
	CUM_REV + revenue;
	if lastobs;
run;

proc print data = my_revhub; title my_revhub; run;


/* 누적 합계 계산 예제 */
data CUM_CARS (keep = cum_invoice);
	format CUM_INVOICE dollar15.;
	set sashelp.cars end = lastobs;
	cum_invoice + invoice;
	if lastobs;
run;

proc print data = CUM_CARS; title mycars; run;


/* 범주별로 누적값 구하기 */
data A B;
	set sashelp.revhub2;
	if hub = 'Sydney' then output a;
	else if hub = 'London' then output b;
run;

data A_CUM;
	set a end = lastobs;
	CUM_REV + revenue;
	if lastobs;
run;

data B_CUM;
	set b end = lastobs;
	CUM_REV + revenue;
	if lastobs;
run;

proc print data = a_cum; title A_CUM; run;
proc print data = b_cum; title B_CUM; run;


/* 편한 방법 */
data MY_REVHUB;
	set sashelp.revhub2;
	if hub = 'Sydney' then CUM_REV_Sy + revenue;
	if hub = 'London' then CUM_REV_Lo + revenue;
run;

proc print data = my_revhub (firstobs = 72); title my_revhub; var cum_rev_sy cum_rev_lo; run;


/* first, last */
data MY_REVHUB;
	set sashelp.revhub2;
	by hub;
	F_HUB = first.hub;
	L_HUB = last.hub;
run;

proc print data = my_revhub; title my_revhub; run;


/* first를 이용해서 누적합 구하기 */
data MY_REVHUB;
	set sashelp.revhub2;
	by hub;
	if first.hub = 1 then CUM_REV = 0;
	cum_rev + revenue;
run;

proc print data = my_revhub; title my_revhub; run;


/* last를 이용해서 범주별 누적합 확인 */
data MY_REVHUB;
	set sashelp.revhub2;
	by hub;
	if first.hub = 1 then CUM_REV = 0;
	cum_rev + revenue;
	if last.hub = 1;
run;

proc print data = my_revhub; title my_revhub; run;


/* 단순화 */
data MY_REVHUB;
	set sashelp.revhub2;
	by hub;
	if first.hub then CUM_REV = 0;
	cum_rev + revenue;
	if last.hub;
run;

proc print data = my_revhub; title my_revhub; var hub cum_rev; run;