data club;
input id name $ team $ strtwght endwght;
cards;
1023 David red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*������ ����*/
data club;
input id name $ team $ strtwght endwght;
cards;
1023456 Kim red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*��� ������ ����*/
data clubhouse;
input id name $ team $ strtwght endwght;
cards;
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*Ž���� -> library -> work ���� ������ ������ Ȯ�� ����*/


/*�����͸� ��ҹ��� ���� X*/
data CLUB;
input id name $ team $ strtwght endwght;
cards;
1023 David red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*�Ķ������� ǥ���� �κ� ��ҹ��� ���� Ȯ��*/
data clubhouse;
input id name $ team $ strtwght endwght;
cards;
1221 jim yellow 220 .
run;

proc print data = clubhouse;
run;

DATA clubhouse;
INPUT id name $ team $ strtwght endwght;
CARDS;
1221 jim yellow 220 .
RUN;

PROC PRINT data = clubhouse;
RUN;


/*������ ��ҹ��� ���� Ȯ��*/
data clubhouse;
input ID NAME $ TEAM $ STRTWGHT ENDWGHT;
cards;
1221 jim yellow 220 .
run;

proc print data = clubhouse;
run;


/*������ ��ҹ��� ���� Ȯ��*/
data clubhouse;
input ID NAME $ TEAM $ STRTWGHT ENDWGHT;
cards;
1221 JIM YELLOW 220 .
run;

proc print data = clubhouse;
run;


/*��� �ڵ� ��ҹ��� ���� Ȯ��*/
DATA CLUBHOUSE;
INPUT ID NAME $ TEAM $ STRTWGHT ENDWGHT;
CARDS;
1221 JIM YELLOW 220 .
RUN;
PROC PRINT DATA = CLUBHOUSE;
RUN;

data clubhouse;
input id name $ team $ strtwght endwght;
cards;
1221 jim yellow 220 .
run;
proc print data = clubhouse;
run;


/*���� ���� �� $�� �տ� ��ġ�� ���� '����'���� �����ϴ� ����*/
data club;
input id name team $ strtwght endwght;
cards;
1023 David red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*���� id�� ���� ����*/
data club;
input id $ name team strtwght endwght;
cards;
1023 David red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*���ο� ���� ����*/
data club;
input id name $ team $ strtwght endwght;
loss = strtwght - endwght;
avgwght = (strtwght + endwght) / 2;
cards;
1023 David red 189 165
1049 Amelia yellow 145 124
1219 Alan red 210 192
1246 Ravi yellow 194 177
1078 Ashley red 127 118
1221 jim yellow 220 .
run;

proc print data = club;
run;
