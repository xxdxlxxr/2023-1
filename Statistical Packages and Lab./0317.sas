/*1,023�� ������ ����*/
data club;
input id name $ team $ strtwght endwght;
cards;
1,023 David red . 165
;
run;

proc print data = club;
run;


/*1,023�� ����*/
data club;
input id comma5. name $ team $ strtwght endwght;
cards;
1,023 David red . 165
;
run;

proc print data = club;
run;


/*comma7*/
data club;
input id comma7. name $ team $ strtwght endwght;
cards;
102,345 David red . 165
;
run;

proc print data = club;
run;


/*comma6 => �� ����(�޸� ���� �ڸ�����ŭ ��������)*/
data club;
input id comma6. name $ team $ strtwght endwght;
cards;
102,345 David red . 165
;
run;

proc print data = club;
run;


/*dollar7.*/
data club_sales;
input id comma7. name $ team $ budget comma5.;
cards;
102,345 David red 2,134
;
run;

proc print data = club_sales;
format budget dollar7.;
run;


/*input���� �ڸ��� ����*/
data club;
input id name $5. team $ strtwght 3. endwght;
cards;
1023 David red 185 165
;
run;

proc print data = club;
run;


/*input���� �ڸ��� �˳��ϰ� ���� => ����� �� ����*/
data club;
input id name $7. team $ strtwght 5. endwght;
cards;
1023 David red 185 165
;
run;

proc print data = club;
run;


/*cards�� �ٸ��� ��������*/
data club;
input id name $ team $ strtwght endwght;
cards;
1023 David red 185 165 1049 Amelia yellow 145 124
;
run;

proc print data = club;
run;


/*input �ڵ� ���� �������� @@*/
data club;
input id name $ team $ strtwght endwght @@;
cards;
1023 David red 185 165 1049 Amelia yellow 145 124
;
run;

proc print data = club;
run;


/*�ٸ� ����*/
data bodyfat;
input sex $ fatpct @@;
cards;
male 13.3 female 22.0
male 22.0 female 23.2
;
run;

proc print data = bodyfat;
run;


/*�ٸ� ����*/
data mathgrade;
input id $ score @@;
cards;
id001 84 id002 57 id003 31 id004 46
;
run;

proc print data = mathgrade;
run;


/*if��*/
data club;
input id name $ team $ strtwght endwght @@;
if team = 'red';
cards;
1023 David red 189 165 1049 Amelia yellow . 124 1219 Alan
red 210 192 1246 Ravi yellow 194 . 1078 Ashley red 127 118
;
run;

proc print data = club;
run;


/*����*/
data club;
input id name $ team $ strtwght endwght @@;
if team = 'red' & strtwght > 150;
cards;
1023 David red 189 165 1049 Amelia yellow . 124 1219 Alan
red 210 192 1246 Ravi yellow 194 . 1078 Ashley red 127 118
;
run;

proc print data = club;
run;


/*label�� => proc print�δ� ��ȭ����*/
data club;
input id name $ team $ strtwght endwght @@;
label
id = 'Identification Number'
strtwght = 'weight before exercising program'
endwght = 'weight after exercisign program';
cards;
1023 David red 189 165 1049 Amelia yellow . 124 1219 Alan
red 210 192 1246 Ravi yellow 194 . 1078 Ashley red 127 118
;
run;

proc print data = club;
run;


/*label�� => proc contents*/
data club;
input id name $ team $ strtwght endwght @@;
label
id = 'Identification Number'
strtwght = 'weight before exercising program'
endwght = 'weight after exercisign program';
cards;
1023 David red 189 165 1049 Amelia yellow . 124 1219 Alan
red 210 192 1246 Ravi yellow 194 . 1078 Ashley red 127 118
;
run;

proc contents data = club;
run;
