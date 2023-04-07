proc sort data = sashelp.cars out = mycars; by type; run;


data CUM_CARS_TYPE;
	format cum_invoice_type dollar15.;
	set mycars end = lastobs;
	by type;
	if first.type then cum_invoice_type = 0;
	cum_invoice_type + invoice;
	if last.type;
run;

proc print data = cum_cars_type; var type cum_invoice_type; run;