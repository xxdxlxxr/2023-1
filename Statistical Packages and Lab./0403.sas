/* 조건식에 대한 실행문이 여러 개일 경우 */
data my_class my_class_m my_class_f;
	length Male $ 6 Female $ 6;
	set sashelp.class;
	if sex = 'M' then do;
		Male = 'TRUE';
		Female = 'FALSE';
		output my_class_m;
	end;
	if sex = 'F' then do;
		Male = 'FALSE';
		Female = 'TRUE';
		output my_class_f;
	end;
	output my_class;
run;

proc print data = my_class; title my_class; run;
proc print data = my_class_m; title my_class_m; run;
proc print data = my_class_f; title my_class_f; run;


/* 이중 IF문 */
data my_class my_class_rm my_class_rf;
	length Male $ 6 Female $ 6;
	set sashelp.class;
	if substr(name, 1, 2) ^= 'Ro' then do;
		if sex = 'M' then do;
			Male = 'TRUE';
			Female = 'FALSE';
			output my_class_rm;
		end;
		if sex = 'F' then do;
			Male = 'FALSE';
			Female = 'TRUE';
			output my_class_rf;
		end;
	end;
	output my_class;
run;

proc print data = my_class; title my_class; run;
proc print data = my_class_rm; title my_class_rm; run;
proc print data = my_class_rf; title my_class_rf; run;


proc print data = sashelp.revhub2; title revhub2; run;
proc contents data = sashelp.revhub2; run;


/* head */
proc print data = sashelp.revhub2 (obs = 5) noobs; title revhub2; run;


/* 변수 생성 순서 */
proc contents data = sashelp.revhub2 varnum; run;


/* 전체 10자리, 소수점 아래 2자리 */
proc print data = sashelp.revhub2;
	format revenue 10.2;
run;


/* 누적 계산 */
data my_revhub;
	set sashelp.revhub2;
	CUM_REV + revenue;
	MYOBS + 1; /* index 생성도 가능 */
run;

proc print data = my_revhub; title my_revhub; run;