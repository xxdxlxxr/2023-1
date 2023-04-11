/* 조합별 누적합 구하기 */
proc sort data = sashelp.revhub2 out = revhub2;
	by hub source;
run;

data my_revhub (drop = type revenue);
	set revhub2;
	by hub source;
	if first.hub | first.source then CUM_REV = 0;
	cum_rev + revenue;
	if last.hub | last.source;
run;

proc print data = my_revhub; title my_revhub; run;


/* 범주별 누적값을 새로운 DATASET으로 */
data my_revhub (keep = cum_rev) my_revhub_h (keep = hub cum_reve);
	set revhub2 end = lastobs;
	by hub;
	if first.hub then CUM_REVE = 0;
	CUM_REV + revenue;
	cum_reve + revenue;
	if lastobs then output my_revhub;
	if last.hub then output my_revhub_h;
run;

proc print data = my_revhub; title my_revhub; run;
proc print data = my_revhub_h; title my_revhub_h; run;


/* retain문 */
data MYTABLE;
	input num @@;
	retain num2;
	output;
	num2 = num;
cards;
1 2 3 4 5 6 7 8 9 10
;
run;

proc print data = mytable; title MYTABLE; run;


/* cum_num에 값이 없어서 찍히지 않음 */
data MYTABLE;
	input num @@;
	cum_num = cum_num + num;
	retain cum_num;
cards;
1 2 3 4 5 6 7 8 9 10
;
run;

proc print data = mytable; title MYTABLE; run;


/* 값이 없을 때 0으로 만들어줌(더할 준비) */
data MYTABLE;
	input num @@;
	if cum_num = . then cum_num = 0;
	cum_num = cum_num + num;
	retain cum_num;
cards;
1 2 3 4 5 6 7 8 9 10
;
run;

proc print data = mytable; title MYTABLE; run;


/* retain문 활용 */
data MY_REVHUB;
	set sashelp.revhub2 (keep = revenue) end = lastobs;
	if CUM_REV = . then cum_rev = 0;
	cum_rev = cum_rev + revenue;
	retain cum_rev;
	if lastobs;
run;

proc print data = my_revhub; title MY_REVHUB; run;


/* 누적할 준비가 되지 않음 */
data MY_REVHUB;
	set sashelp.revhub2;
	CUM_REV - revenue;
run;

proc print data = my_revhub; title MY_REVHUB; run;


/* 누적차 */
data MY_REVHUB;
	set sashelp.revhub2;
	if CUM_REV = . then cum_rev = 0;
	cum_rev = cum_rev - revenue;
	retain cum_rev;
run;

proc print data = my_revhub; title MY_REVHUB; run;


/* 누적할 준비가 되지 않음 */
data MY_REVHUB;
	set sashelp.revhub2;
	CUM_REV * revenue;
run;

proc print data = my_revhub; title MY_REVHUB; run;


/* 누적곱 */
data MY_REVHUB;
	set sashelp.revhub2;
	if CUM_REV = . then cum_rev = 1;
	cum_rev = cum_rev * revenue;
	retain cum_rev;
run;

proc print data = my_revhub; title MY_REVHUB; run;


/* 날짜 표현 */
data TEMP;
	input Date1 date11. @13 Date2 mmddyy8. @22 Date3 mmddyy10.;
	cards;
05-apr-1946 04/05/21 04/05/1946
;
run;

proc print data = temp; format Date1 Date2 Date3 worddate20.; title TEMP; run;


/* 날짜 형식 */
data TEMP2;
	input Date mmddyy10.;
	cards;
12/31/1959
01/01/1960
01/02/1960
01/05/1960
01/10/1961
04/10/2023
;
run;

proc print data = temp2; title TEMP2; run;


/* array 활용하여 결측값 수정 */
data MY_QTR111 (drop = i);
	set sashelp.qtr111;
	array tmparray{5} S184 S229 S238 S292 S301;
	do i = 1 to 5;
		if tmparray{i} = . then tmparray{i} = 0;
	end;
run;

proc print data = my_qtr111; title MY_QTR111; run;


/* 결측값 수정하고 누적합 구하기 */
data MY_QTR111;
	set sashelp.qtr111;
	array tmparray{5} S184 S229 S238 S292 S301;
	do i = 1 to 5;
		if tmparray{i} = . then tmparray{i} = 0;
	end;
	array tmparray2{9} S184 S229 S238 S292 S301 S328 S337 S364 S382;
	array tmparray3{9} CUM_S184 CUM_S229 CUM_S238 CUM_S292 CUM_S301 CUM_S328 CUM_S337 CUM_S364 CUM_S382;
	do i = 1 to 9;
		tmparray3{i} + tmparray2{i};
	end;
run;

proc print data = my_qtr111; title MY_QTR111; run;


/* CUM_1 - CUM_9 코드로 변수 범위 지정 */
data MY_QTR111;
	set sashelp.qtr111;
	array tmparray{5} S184 S229 S238 S292 S301;
	do i = 1 to 5;
		if tmparray{i} = . then tmparray{i} = 0;
	end;
	array tmparray2{9} S184 S229 S238 S292 S301 S328 S337 S364 S382;
	array tmparray3{9} CUM_1 - CUM_9;
	do i = 1 to 9;
		tmparray3{i} + tmparray2{i};
	end;
run;

proc print data = my_qtr111; title MY_QTR111; run;