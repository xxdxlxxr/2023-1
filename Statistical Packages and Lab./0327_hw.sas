data fish_changed;
set sashelp.fish;
if species = 'Whitefish' & length2 > 30;
if abs(length1 - length2) > 2.6 then DIFF = 'over';
else DIFF = 'less';
run;

proc sort data = fish_changed;
by species;
run;


data iris_changed;
set sashelp.iris;
if sepallength > 60 & sepalwidth < 25;
run;

proc sort data = iris_changed;
by species;
run;


data fish_iris;
set iris_changed fish_changed;
by species;
run;

proc print data = fish_iris;
title 과제1_데이터병합_정기택;
run;


/* solution */
data fish_changed;
set sashelp.fish;
if species = 'Whitefish' & length2 > 30;
run;

proc sort data = fish_changed;
by species;
run;


data iris_changed;
set sashelp.iris;
if sepallength > 60 & sepalwidth < 25;
run;

proc sort data = iris_changed;
by species;
run;


data fish_iris;
length species $ 10;
merge fish_changed iris_changed;
by species;
if abs(length1 - length2) > 2.6 then DIFF = 'over';
else DIFF = 'less';
run;

proc print data = fish_iris;
title 과제1_데이터병합_정기택;
run;