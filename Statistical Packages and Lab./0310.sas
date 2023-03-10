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


/*데이터 변형*/
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


/*출력 데이터 주의*/
data clubhouse;
input id name $ team $ strtwght endwght;
cards;
1221 jim yellow 220 .
run;

proc print data = club;
run;


/*탐색기 -> library -> work 에서 지정한 데이터 확인 가능*/


/*데이터명 대소문자 구분 X*/
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


/*파란색으로 표현된 부분 대소문자 차이 확인*/
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


/*변수명 대소문자 차이 확인*/
data clubhouse;
input ID NAME $ TEAM $ STRTWGHT ENDWGHT;
cards;
1221 jim yellow 220 .
run;

proc print data = clubhouse;
run;


/*데이터 대소문자 차이 확인*/
data clubhouse;
input ID NAME $ TEAM $ STRTWGHT ENDWGHT;
cards;
1221 JIM YELLOW 220 .
run;

proc print data = clubhouse;
run;


/*모든 코드 대소문자 차이 확인*/
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


/*변수 선언 시 $는 앞에 위치한 열이 '문자'임을 선언하는 역할*/
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


/*변수 id만 문자 선언*/
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


/*새로운 변수 선언*/
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
