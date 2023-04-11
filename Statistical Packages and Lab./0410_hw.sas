data MYDATA (keep = y x1 x2);
set sashelp.leutrain sashelp.leutest;
run;

proc print data = mydata; title MYDATA; run;


data LEU;
	set mydata;
	if y = 1 then CUM_SUM + x1;
	else if y = -1 then CUM_SUM + x2;
run;

proc print data = leu; title LEU; run;


data CARS;
	set sashelp.cars (keep = make msrp invoice);
	retain TEMP;
	COST = msrp - invoice;
	output;
	temp = cost;
run;

proc print data = cars; run;


data CARS2;
	set sashelp.cars (keep = make msrp invoice);
	retain TEMP;
	COST = msrp - invoice;
	if cost > temp then temp = cost;
run;

proc print data = cars2; run;
