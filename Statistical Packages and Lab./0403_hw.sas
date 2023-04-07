data MY_MANAGE;
	set sashelp.manage (keep = title keywords);
	KEYWORD_1 = scan(keywords, 1, ' ');
	KEYWORD_2 = scan(keywords, 2, ' ');
	KEYWORD_3 = scan(keywords, 3, ' ');
	KEYWORD_4 = scan(keywords, 4, ' ');
run;

proc print data = MY_MANAGE; title 과제2_MANAGE_정기택; run;


data MY_MANAGE_M MY_MANAGE_F MY_MANAGE_O;
	set MY_MANAGE;
	if KEYWORD_1 = 'male' or KEYWORD_2 = 'male' or KEYWORD_3 = 'male' or KEYWORD_4 = 'male' then output MY_MANAGE_M;
	else if KEYWORD_1 = 'female' or KEYWORD_2 = 'female' or KEYWORD_3 = 'female' or KEYWORD_4 = 'female' then output MY_MANAGE_F;
	else do;
		title = upcase(title);
		output MY_MANAGE_O;
	end;
run;

proc print data = MY_MANAGE_M; title 과제2_MANAGE_정기택; title2 MALE; run;
proc print data = MY_MANAGE_F; title 과제2_MANAGE_정기택; title2 FEMALE; run;
proc print data = MY_MANAGE_O; title 과제2_MANAGE_정기택; title2 OTHERS; run;