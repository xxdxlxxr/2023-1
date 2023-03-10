data mytable;
input name $ sex $ height weight;
BMI = 703 * weight / height ** 2;
cards;
Kim male 170 65
Lee male 190 100
Park female 160 50
run;

proc print data = mytable;
run;