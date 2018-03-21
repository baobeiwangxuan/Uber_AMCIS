
select *
into uber_2007_2015_hour
from
(select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and DRUNK_DR=1 and age between 18 and 34
order by Fars_2007.st_case
Union all
select Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11
union all
select Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11
union all
select Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year, Fars_2010.month,Fars_2010.day,Fars_2010.hour,Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11
Union all
select Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11
Union all
select Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11
Union all
select Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11
Union all
select Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11
Union all
select Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour, Persons, Drunk_dr,Fatals,Age, sex, Drinking, seat_pos, ALC_RES
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11) c



select * 
into fatals_2007_2015_hour
from
(
select state, city, county, fatals,year,month,day,hour, drunk_dr
from Fars_2007
union all
select state, city, county, fatals,year, month,day, hour,drunk_dr
from Fars_2008
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2009
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2010
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2011
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2012
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2013
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2014
union all
select state, city, county, fatals,year,month,day, hour, drunk_dr
from Fars_2015) c

select state, city, county, year,month, drunk_dr,sum(FATALS) as total
into total_fatals_month
from fatals_2007_2015_month
group by state, city, county, year,month, drunk_dr
order by year,month,state, county, city, drunk_dr

select st_case, state, county, year, month, day, hour, Day_week,fatals
from fars_2007
where DRUNK_DR = 1 and 
(select age
from person2007
where 18 =< age <= 34 )

from fars proto3_new

select *
from

(select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34
order by Fars_2007.st_case
union all

select distinct Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34
order by Fars_2008.st_case
union all

select distinct Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34
order by Fars_2009.st_case
union all

select distinct Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year,Fars_2010.month,Fars_2010.day,Fars_2010.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34
order by Fars_2010.st_case
union all

select distinct Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34
order by Fars_2011.st_case
union all

select distinct Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34
order by Fars_2012.st_case
union all

select distinct Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34
order by Fars_2013.st_case
union all

select distinct Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34
order by Fars_2014.st_case
union all

select distinct Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34
order by Fars_2015.st_case)c




select *
into uber_2007_2015_drinking
from
(select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 

union all


select distinct Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and drinking=1

union all

select distinct Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year,Fars_2010.month,Fars_2010.day,Fars_2010.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1

union all
select distinct Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour,DAY_WEEK, Persons, Drunk_dr,Fatals,age
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1)c




select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and Fars_2007.St_case not in
(select distinct Fars_2007.St_Case
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34)
order by 1


select distinct Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and Fars_2008.St_case not in
(select distinct Fars_2008.St_Case
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34)
order by 1


select distinct Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and Fars_2009.ST_CASE not in
(select distinct Fars_2009.St_Case
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34)
order by Fars_2009.st_case


select distinct Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year,Fars_2010.month,Fars_2010.day,Fars_2010.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and Fars_2010.ST_CASE not in
(select distinct Fars_2010.St_Case
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34)
order by Fars_2010.st_case


select distinct Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and fars_2011.ST_CASE not in
(select distinct Fars_2011.St_Case
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34)
order by Fars_2011.st_case


select distinct Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and fars_2012.ST_CASE  not in
(select distinct Fars_2012.St_Case
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34)
order by Fars_2012.st_case


select distinct Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and fars_2013.st_case not in
(select distinct Fars_2013.St_Case
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34)
order by Fars_2013.st_case


select distinct Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and fars_2014.ST_CASE not in
(select distinct Fars_2014.St_Case
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34)
order by Fars_2014.st_case


select distinct Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour,DAY_WEEK, Persons, Drunk_dr,Fatals
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and fars_2015.st_case not in
(select distinct Fars_2015.St_Case
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34)
order by Fars_2015.st_case



driver 17-34s, based on driver level

select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,sex,age,per_no,VEH_NO
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by Fars_2007.st_case

select *
from person2007
where seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by ST_CASE


select distinct Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour,sex,age,per_no,veh_no
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by Fars_2008.st_case


select distinct Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour,sex,age,per_no,veh_no
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34 and inj_sev=4
order by Fars_2009.st_case


select distinct Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year,Fars_2010.month,Fars_2010.day,Fars_2010.hour,sex,age,per_no,veh_no
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34 and inj_sev=4
order by Fars_2010.st_case


select distinct Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour, sex,age,per_no,veh_no
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34 and inj_sev=4
order by Fars_2011.st_case


select distinct Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour,sex,age,per_no,veh_no
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34 and inj_sev=4
order by Fars_2012.st_case

select distinct Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour,sex,age,per_no,veh_no
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and DRINKING=1 and age between 17 and 34 and inj_sev=4
order by Fars_2013.st_case


select distinct Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour,sex,age,per_no,veh_no
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by Fars_2014.st_case


select distinct Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour,sex,age,per_no,veh_no
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by Fars_2015.st_case





driver 35-65s, based on driver level

select distinct Fars_2007.St_Case, Fars_2007.State, Fars_2007.County, city,year,Fars_2007.month,Fars_2007.day,Fars_2007.hour,sex,age,per_no,VEH_NO
from Fars_2007, Person2007
Where Fars_2007.ST_Case = Person2007.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and inj_sev=4
order by Fars_2007.st_case

select *
from person2007
where seat_pos=11 and drinking=1 and age between 17 and 34 and inj_sev=4
order by ST_CASE


select distinct Fars_2008.St_Case, Fars_2008.State, Fars_2008.County, city,year,Fars_2008.month,Fars_2008.day,Fars_2008.hour,sex,age,per_no,veh_no
from Fars_2008, Person2008
Where Fars_2008.ST_Case = Person2008.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and inj_sev=4
order by Fars_2008.st_case


select distinct Fars_2009.St_Case, Fars_2009.State, Fars_2009.County, city,year,Fars_2009.month,Fars_2009.day,Fars_2009.hour,sex,age,per_no,veh_no
from Fars_2009, Person2009
Where Fars_2009.ST_Case = Person2009.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and inj_sev=4
order by Fars_2009.st_case


select distinct Fars_2010.St_Case, Fars_2010.State, Fars_2010.County, city,year,Fars_2010.month,Fars_2010.day,Fars_2010.hour,sex,age,per_no,veh_no
from Fars_2010, Person2010
Where Fars_2010.ST_Case = Person2010.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and inj_sev=4
order by Fars_2010.st_case


select distinct Fars_2011.St_Case, Fars_2011.State, Fars_2011.County, city,year,Fars_2011.month,Fars_2011.day,Fars_2011.hour, sex,age,per_no,veh_no
from Fars_2011, Person2011
Where Fars_2011.ST_Case = Person2011.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and inj_sev=4
order by Fars_2011.st_case


select distinct Fars_2012.St_Case, Fars_2012.State, Fars_2012.County, city,year,Fars_2012.month,Fars_2012.day,Fars_2012.hour,sex,age,per_no,veh_no
from Fars_2012, Person_2012
Where Fars_2012.ST_Case = Person_2012.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and inj_sev=4
order by Fars_2012.st_case

select distinct Fars_2013.St_Case, Fars_2013.State, Fars_2013.County, city,year,Fars_2013.month,Fars_2013.day,Fars_2013.hour,sex,age,per_no,veh_no
from Fars_2013, Person_2013
Where Fars_2013.ST_Case = Person_2013.ST_CASE and seat_pos=11 and DRINKING=1 and age between 35 and 65 and inj_sev=4
order by Fars_2013.st_case


select distinct Fars_2014.St_Case, Fars_2014.State, Fars_2014.County, city,year,Fars_2014.month,Fars_2014.day,Fars_2014.hour,sex,age,per_no,veh_no
from Fars_2014, Person_2014
Where Fars_2014.ST_Case = Person_2014.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and inj_sev=4
order by Fars_2014.st_case


select distinct Fars_2015.St_Case, Fars_2015.State, Fars_2015.County, city,year,Fars_2015.month,Fars_2015.day,Fars_2015.hour,sex,age,per_no,veh_no
from Fars_2015, Person_2015
Where Fars_2015.ST_Case = Person_2015.ST_CASE and seat_pos=11 and drinking=1 and age between 35 and 65 and inj_sev=4
order by Fars_2015.st_case

