data mytable;
input name $ 1-9 sex $ height weight misc $;
BMI = 703 * weight / height ** 2;
cards4;
Kim Minsu male 170 . missing;
Choi Hiho male 180 100 .
Nam YunJi female 160 60 .
Lee Naeun female 167 59 .
;;;;

proc print data = mytable;
run;

proc tabulate data = mytable;
class sex;
var BMI;
table sex, mean * BMI;
title 'BMI 평균';
run;

proc tabulate data = mytable;
class sex;
var BMI;
table sex, max * BMI;
title 'BMI 최대값';
run;