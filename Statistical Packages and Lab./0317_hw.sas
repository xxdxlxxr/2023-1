data mydata;
input country :$12. tourtype :$12. nights landcost vendor $ @@;
cards;
Spain architecture 10 510 World Japan architecture 8 720 Express
Switzerland scenery 9 734 World France architecture 8 575 World
Ireland scenery 7 558 Express NewZealand scenery 16 1489 Southsea
Italy architecture 8 468 Express Greece scenery 12 698 Express
;
run;

proc print data = mydata;
run;