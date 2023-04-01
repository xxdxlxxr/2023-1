/* 0327_hw review */
/* round(abs(length1 - length2), 3) 가 더 정확한 코드 */


proc contents data = sashelp.humid;
run;


data my_humid;
set sashelp.humid;
bulbtemp_c = (bulbtemp - 32) * 5 / 9;
airtemp_c = (airtemp - 32) * 5 / 9;
temp_c_max = max(bulbtemp_c, airtemp_c);
run;

proc print data = my_humid;
title my_humid;
run;


data my_humid;
set my_humid;
if airtemp_c > 0 then AirTemp_zero = 'over';
else AirTemp_zero = 'less';
run;

proc print data = my_humid;
title my_humid;
run;


data my_humid;
set my_humid;
MIX = substr(colorvar, 1, 2) || airtemp_zero;
run;

proc print data = my_humid;
title my_humid;
run;


data my_class;
length Shape $ 6;
set sashelp.class;
if substr(name, 1, 2) ^= 'Ro';
bmi = 703 * weight / height ** 2;
if bmi < 18.5 then Shape = 'Under';
else if bmi < 25 then Shape = 'Normal';
else Shape = 'over';
run;

proc print data = my_class;
title my_class;
run;


/* 데이터 나누기 */
data my_class_m;
set my_class;
if my_class = 'M';
run;

data my_class_f;
set my_class;
if my_class = 'F';
run;


/* 더 쉬운 방법 */
data my_class_m my_class_f;
set my_class;
if sex = 'M' then output my_class_m;
else if sex = 'F' then output my_class_f;
run;

proc print data = my_class_m;
title my_class_m;
run;

proc print data = my_class_f;
title my_class_f;
run;


data my_class_mu my_class_mn;
set my_class;
if shape = 'Under' & sex = 'M' then output my_class_mu;
else if shape = 'Normal' & sex = 'M' then output my_class_mn;
run;

proc print data = my_class_mu;
title my_class_mu;
run;

proc print data = my_class_mn;
title my_class_mn;
run;


data my_class my_class_m;
set my_class;
if sex = 'M' then Male = 'TRUE';
if sex = 'M' then Female = 'FALSE';
if sex = 'M' then output my_class_m;
output my_class;
run;

proc print data = my_class;
title my_class;
run;

proc print data = my_class_m;
title my_class_m;
run;