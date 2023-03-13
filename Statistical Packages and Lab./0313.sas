/*result window clear(창 정리)*/
ods html newfile = print;


/*데이터에 띄어쓰기 or ; 처리 필요*/
data club_misc;
input id name $ team$ strtwght endwght misc;
cards;
1023 David Shaw red 189 165 ;
1049 Amelia Serrano yellow . 124 .
1219 Alan Nance red 210 192 .
1246 Ravi Sinha yellow 194 . .
1078 Ashley McKnight red 127 118 ;
;
run;

proc print data = club_misc;
run;


/*기본 8바이트 할당*/
data club_temp;
input id name $ team $ strtwght endwght;
cards;
1023 DavidShaw red 189 165 .
run;

proc print data = club_temp;
run;


/*변수 용량 지정*/
data club_temp;
input id name $ 6-14 team$ strtwght endwght;
cards;
1023 DavidShaw red 189 165 .
run;

proc print data = club_temp;
run;


/*빈칸으로 열 맞추기*/
data club_temp2;
input id name $ 6-19 team $ 21-26 strtwght endwght;
cards;
1023 David Shaw      red    189 165
1049 Amelia Serrano yellow . 124
run;

proc print data = club_temp2;
run;


/*자료 구분(열 번호)*/
data club_temp2;
input id 1-4 name $ 6-19 team $ 21-26 strtwght 28-30 endwght 32-34;
cards;
1023 David Shaw     red    189 165
1049 Amelia Serrano yellow .   124
run;

proc print data = club_temp2;
run;


/*'.'과 아무것도 없을 때 비교*/
data club_temp;
input id name $ team $ strtwght endwght;
cards;
1023 David red . 165
;
run;

proc print data = club_temp;
run;

data club_temp;
input id name $ team $ strtwght 15-16 endwght;
cards;
1023 David red   165
;
run;

proc print data = club_temp;
run;


/*cards와 cards4*/
data club_temp;
input id name $ team $ strtwght endwght;
cards;
1023 David red 189 165
;
run;

proc print data = club_temp;
run;

data club_temp;
input id name $ team $ strtwght endwght;
cards4;
1023 David red 189 165
;;;;
run;

proc print data = club_temp;
run;


/*';' 포함 자료*/
data club_temp;
input id name $ team $ strtwght endwght misc $;
cards;
1023 David red 189 165 ;
;
run;

proc print data = club_temp;
run;

data club_temp;
input id name $ team $ strtwght endwght misc $;
cards4;
1023 David red 189 165 ;
;;;;
run;

proc print data = club_temp;
run;


/* line 5 코드 해결 */
data club_misc;
input id name $ 6-20 team $ 22-27 strtwght endwght misc $;
cards4;
1023 David Shaw      red    189 165 ;
1049 Amelia Serrano  yellow . 124 .
1219 Alan Nance      red    210 192 .
1246 Ravi Sinha      yellow 194 . .
1078 Ashley McKnight red    127 118 ;
;;;;
run;

proc print data = club_misc;
run;


/*결과창에 제목(title) 부여*/
data club;
input id name $ 6-20 team $ 22-27 strtwght endwght misc $;
cards4;
1023 David Shaw      red    189 165 ;
1049 Amelia Serrano  yellow . 124 .
1219 Alan Nance      red    210 192 .
1246 Ravi Sinha      yellow 194 . .
1078 Ashley McKnight red    127 118 ;
;;;;
run;

proc print data = club;
run;

proc print data = club;
title 'Health Club Data';
run;

proc print data = club;
title 'Health Club Data';
title2 'Team red and team yellow';
run;


/*일부 변수만 print*/
proc print data = club;
var name strtwght endwght;
run;


/*title / var*/
proc print data = club;
title 'Health Clbu Data';
title2 'Team red and team yellow';
var team name;
run;


/*proc tabulate*/
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
;
run;

proc print data = club;
run;

proc tabulate data = club;
class team;
var strtwght endwght loss;
table team, mean * (strtwght endwght loss);
title 'Mean Starting Weight/Ending Weight/Weight Loss';
run;


/*옵션 관찰 = > 1번만 돌아감*/
proc tabulate data = club;
class team;
var strtwght endwght loss;
table team, mean * (strtwght endwght loss);
run;

proc tabulate data = club;
class team;
var strtwght endwght loss;
table team, mean * (avgwght);
title 'Mean Starting Weight/Ending Weight/Weight Loss';
run;

proc tabulate data = club;
var strtwght endwght loss;
table team, mean * (strtwght endwght loss);
title 'Mean Starting Weight/Ending Weight/Weight Loss';
run;

proc tabulate data = club;
class team;
table team, mean * (strtwght endwght loss);
title 'Mean Starting Weight/Ending Weight/Weight Loss';
run;
