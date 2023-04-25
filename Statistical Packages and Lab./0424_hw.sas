proc sql;

create table MYTABLE (
	name char(13),
	sex char,
	height num,
	weight num,
	misc char
	)
;

insert into mytable
	values ('Kim Minsu', 'male', 170, ., 'missing;')
	values ('Lee Chulsu', 'male', 190, 100, '')
	values ('Park Younghee', 'female', 160, 50, '')
;

select *, 703 * weight / height ** 2 as BMI
	from mytable
	order by sex, height desc;