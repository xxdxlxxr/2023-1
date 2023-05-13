proc sql;

create table FISH_1 as
	select species, length1, weight
	from sashelp.fish
	where length1 in (52, 24.1, 23.2)
;

select * from fish_1;

create table FISH_2 as
	select species, length2, weight
	from sashelp.fish
	where length2 in (26.3, 41.7)
;

select * from fish_2;

select A.species, A.length1, B.length2, A.weight
	from fish_1 as A inner join fish_2 as B
	on A.species = B.species;
	
select A.species, A.length1, B.length2, A.weight
	from fish_1 as A left join fish_2 as B
	on A.species = B.species;
	
select coalesce(A.species, B.species) as NEW_NAME, A.length1, B.length2, A.weight
	from fish_1 as A full outer join fish_2 as B
	on A.species = B.species;