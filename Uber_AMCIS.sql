/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [State_Name]
      ,[State_Abbreviation]
      ,[State_Code]
      ,[City_Name_County_Name]
      ,[City_Code]
      ,[County_Code]
      ,[citykey]
      ,[countykey]
      ,[locationkey]
      ,[added]
      ,[CountyName]
  FROM [DimLocation]

  select distinct City_Name_County_Name
  from DimLocation, UberX_cities
  where DimLocation.State_Name= UberX_cities.STATE1 and DimLocation.City_Name_County_Name=UberX_cities.CITY1
  order by City_Name_County_Name

  select city_name_county_name
  from DimLocation
  where State_Name = 'NORTH CAROLINA'
  order by City_Name_County_Name

  select State_Name, State_Abbreviation, State_Code,City_Name_County_Name,City_Code,County_Code,citykey, countykey, locationkey, CountyName,2015_estimate, Uber_Service, enter_Time
  into Cities
  from DimLocation, UberX_cities
  where DimLocation.State_Name= UberX_cities.STATE1 and DimLocation.City_Name_County_Name=UberX_cities.CITY1
  order by City_Name_County_Name


  select state_name,state_abbreviation,city_name_county_name,countyname, Uber_service, enter_time, year, drunk_dr, total
  from total_fatals, cities
  where cities.state_code=total_fatals.state and cities.county_code=total_fatals.county and cities.city_code=total_fatals.city
  order by state_name, City_Name_County_Name,year

  alter table fatals_2007_2015_hour
  add date_time date null

  alter table fatals_2007_2015_hour
  add weekd nvarchar(30) null

  date_time=DATEFROMPARTS( year, month, day )

  ALTER TABLE fatals_2007_2015_hour ADD datetime as DATEFROMPARTS(year, month, day);  

ALTER TABLE fatals_2007_2015_hour ADD week_day as DATENAME(Weekday,DATEFROMPARTS(year, month, day));

alter table cities add month3 as datepart(mm,enter_time)

alter table uberx_cities add year as datepart(yy,enter_time)

alter table cities add year as datepart(yy,enter_time)

select datepart(mm,enter_time) as month
from uberX_cities

alter table cities
add quarter float null

update cities
set quarter=case
when month3 between 1 and 3 then 1
when month3 between 4 and 6 then 2
when month3 between 7 and 9 then 3
when month3 between 10 and 12 then 4
else 5
end

select a_quarter, count(*) as total
from uber_2007_2015
group by a_quarter

alter table uber_2007_2015
add a_quarter float null

update uber_2007_2015
set a_quarter=case
when month between 1 and 3 then 1
when month between 4 and 6 then 2
when month between 7 and 9 then 3
when month between 10 and 12 then 4
else 5
end

select * 
into uber_2007_2015_hour
from Uber_2007_2015
where hour between 0 and 3 or hour between 20 and 23

select * 
into uber_2007_2015_weekend
from Uber_2007_2015
where weekday between 5 and 7


select *
from fatals_2007_2015_hour
where day=31

update fatals_2007_2015_hour
set weekd=week_day

select day, count(*) as total
from fatals_2007_2015_hour
group by day
order by day

select week_day, count(*) as total
from fatals_2007_2015_hour
group by week_day
order by week_day

select *
from fatals_2007_2015_hour
where day =99

delete
from fatals_2007_2015_hour
where day =99

select *
from fatals_2007_2015_hour
order by day

select distinct STATE1
from uberX_cities

select distinct city1, popu.state1,popestimate2007,popestimate2008,popestimate2009,popu_07_09.city,popu_07_09.State
from popu,popu_07_09
where popu.state1=popu_07_09.state1 and popu.city2=popu_07_09.City
order by POPESTIMATE2007

select  city1, popu.state1,p_2010,p_2011,p_2012,p_2013,p_2014,p_2015
from popu, popu_10_15
Where popu.State1=LTRIM(popu_10_15.state) and popu.city1=popu_10_15.city

select LTRIM(State) 
from popu_10_15

select State_Num, city_popu.city,city_popu.state,city_popu.year,city_population,income, poverty, with_bachelor_degree, unemployment_rate, 
population,VMT_Fourth_Q,VMT_Third_Q, VMT_second_Q, VMT_first_Q
from city_popu,economic
where city_popu.state=economic.state1 and city_popu.year=economic.Year

select Uber_service
from cities
where Uber_service in ('No service')

select Uber_service,count(*) as total
from cities
group by uber_service

Delete
from cities
where Uber_service in ('No service')


  select state_name,state_abbreviation,city_name_county_name,countyname, Uber_service, enter_time, year, drunk_dr, total
  from , cities
  where cities.state_code=total_fatals.state and cities.county_code=total_fatals.county and cities.city_code=total_fatals.city
  order by state_name, City_Name_County_Name,year

  select State_name, city_name_county_name,countyname,enter_time,cities.year, cities.quarter,year1,fatals,a_quarter
  into drink_fatals
  from cities, uber_2007_2015
  where cities.state_code=uber_2007_2015.state and cities.county_code=uber_2007_2015.county and cities.City_Code=uber_2007_2015.city
  order by fatals

select State_name,city_name_county_name,year,quarter,year1,a_quarter, sum(fatals)as fatal_total
into city_fatal
  from drink_fatals
  group by state_name, city_name_county_name,year,quarter,year1,a_quarter


  select State_name,city_name_county_name,cities.year,quarter,uber_2007_2015.year1,a_quarter, sum(fatals)as total
  from cities, uber_2007_2015
  where cities.state_code=uber_2007_2015.state and cities.county_code=uber_2007_2015.county and cities.City_Code=uber_2007_2015.city
  group by state_name, city_name_county_name,cities.year,quarter,uber_2007_2015.year1,a_quarter

  select state_num, city, state, city_fatal.year,city_fatal.quarter,year1,a_quarter,fatal_total,city_population,income, poverty,
  with_bachelor_degree, unemployment_rate, VMT_Q, PKEY
  from city_fatal,economic
  Where city_fatal.State_name=economic.state and city_fatal.city_name_county_name=economic.city and city_fatal.year1=economic.year
  and city_fatal.a_quarter=economic.quarter

  select state_num, city, state, city_fatal.year,city_fatal.quarter,year1,a_quarter,fatal_total,city_population,income, poverty,
  with_bachelor_degree, unemployment_rate, VMT_Q,PKEY
  into uber_fatal
  from city_fatal,economic
  Where city_fatal.State_name=economic.state and city_fatal.city_name_county_name=economic.city and city_fatal.year1=economic.year
  and city_fatal.a_quarter=economic.quarter

  alter table uber_fatal
  add uberx float null

  update uber_Fatal
  set uberx=case
  when (year1=year and a_quarter<=quarter) or (year1 < year) then 0
  when (year1=year and a_quarter>quarter) or (year1 > year) then 1
  else 2
  end 

  select uberx, count(*) as total
  from uber_fatal
  group by uberx

  select distinct uber_fatal.state_num, uber_fatal.city, uber_fatal.state, uber_fatal.year,uber_fatal.quarter,year1,a_quarter,fatal_total,
  uber_fatal.city_population,uber_fatal.income, uber_fatal.poverty,
  uber_fatal.with_bachelor_degree, uber_fatal.unemployment_rate, uber_fatal.VMT_Q
  from uber_fatal,economic
  Where economic.city <> uber_fatal.city and economic.state<>uber_fatal.state and economic.year<>uber_fatal.year1 and economic.quarter<>uber_fatal.a_quarter

  select fatal_total
  from uber_fatal
  order by fatal_total


select * 
from economic
where pkey not in ( select PKEY from uber_fatal)

 select distinct state_num, city, state, year1,quarter1,year,quarter,city_population,income, poverty,
  with_bachelor_degree, unemployment_rate, VMT_Q,PKEY
  into fatal_zero1
  from fatal_zero,cities
  where fatal_zero.city=cities.City_Name_County_Name and fatal_zero.state=cities.state_name

    alter table fatal_zero1
  add uberx float null

  update fatal_zero1
  set uberx=case
  when (year1=year and quarter1<=quarter) or (year1 < year) then 0
  when (year1=year and quarter1>quarter) or (year1 > year) then 1
  else 2
  end 

  select uberx,count(*) as total
  from fatal_zero1
  group by uberx

  select * from uber_fatal

  select * from fatal_zero1

  (
  select state_code,state_name, city_name_county_name, enter_time,population,fatals,hour,fatals_2007_2015_hour.year,drunk_dr,datetime, week_day
into propensity_uberx
from cities, fatals_2007_2015_hour
where cities.state_code=fatals_2007_2015_hour.state and cities.city_code=fatals_2007_2015_hour.city and cities.County_Code=fatals_2007_2015_hour.county

alter table propensity_uberx
alter column treatment int null

update propensity_uberx
set treatment=case
when enter_time >datetime then '0'
when enter_time <= datetime then '1'
else '2'
end

select treatment, count(*) as total
from propensity_uberx
group by treatment



alter table propensity_uberx
add treatment1 int null

update propensity_uberx
set treatment1=case
when enter_time >datetime then '1'
when enter_time <= datetime then '0'
else '2'
end

select treatment, count(*) as total
from propensity_uberx
group by treatment

select state_code,state_name,city_name_county_name,enter_time,fatals, hour, propensity_uberx.year, drunk_dr, datetime, week_day, treatment,
treatment1,city_population
from propensity_uberx, economic
where propensity_uberx.city_name_county_name=economic.city and propensity_uberx.state_name=economic.state and economic.year=2015 and economic.Quarter=1

)

select drunk_dr, count (*) as total
from uber_2007_2015
group by drunk_dr


delete
from uber_yes0_half
where a_quarter = 2 or a_quarter=4

  alter table uber_yes0_half
  add uberx1 float null

  update uber_yes0_half
  set uberx1=case
  when (year1=year and half_year<=half_year1) or (year1 < year) then 0
  when (year1=year and half_year>half_year1) or (year1 > year) then 1
  else 2
  end 

  select uberx1, count(*) as total
  from uber_yes0_half
  group by uberx1

  select *
  from uber_yes0_half

  select time, uberx, AVG(fatal_predict) as avgerage
  from after1
  group by time,uberx
  order by time, uberx

  select time,uberx, AVG(predict_d) as average
  from after_new
  group by time, uberx
  order by time, uberx

  select time,uberx, AVG(difference2) as average
  from after_10
  group by time, uberx
  order by time, uberx
 
 
 select *
 from uber_2007_2015
 where state=36 and city=4170 and county=5 and (year1 =2013 or year1=2014 or year1=2015)

 select state, city, county, year1,a_quarter, sum(fatals) as total_fatal
 into uber_new
 from uber_2007_2015
 group by state, city, county, year1, a_quarter

 select state, city, year, a_quarter, sum(total_fatal) as total
 from uber_new
 where (state=36 and city=4170 and county=5 )or (state=36 and city=4170 and county=47 ) or (state=36 and city=4170 and county=61 )
 or (state=36 and city=4170 and county=81 ) or (state=36 and city=4170 and county=85 )
 order by year1, a_quarter, county


 select state_name, state_abbreviation, city_name_county_name,year,quarter, year1, a_quarter, total_fatal
 from cities, uber_new
 where cities.state_code=uber_new.state and cities.city_code=uber_new.city and cities.county_code=uber_new.county
 order by city_name_county_name, year1, a_quarter

 select *
 from dimlocation
 where City_Name_County_Name in ('NEW YORK CITY')

 
 select state, city, year1, a_quarter, sum(total_fatal) as total
 from uber_new
 where (state=36 and city=4170 and county=5 )or (state=36 and city=4170 and county=47 ) or (state=36 and city=4170 and county=61 )
 or (state=36 and city=4170 and county=81 ) or (state=36 and city=4170 and county=85 )
 group by state, city, year1, a_quarter
 order by year1, a_quarter

 select *
 from dimlocation
 where City_Name_County_Name in ('LOS ANGELES')