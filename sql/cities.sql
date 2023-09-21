select 38 as latitude, 122 as longitude, "Berkeley" as name;

create table cities as
  select 38 as latitude, 122 as longitude, "Berkeley" as name union
  select 42,             71,               "Cambridge"        union
  select 45,             93,               "Minneapolis";

select * from cities;

select name, 60*abs(latitude-38) from cities;

create table distances as
  select name, 60*abs(latitude-38) as distance from cities;

select distance/5, name from distances;

create table cold as
  select "Chicago" as name union
  select name from cities where latitude > 43;

select name, " is cold!" from cold;

select distance, name from distances order by -distance;

create table temps as
  select "Berkeley" as city, 60 as temp union
  select "Chicago"         , 50         union
  select "Minneapolis"     , 45;

select * from cities, temps;

select latitude, temp from cities, temps where name = city;

select a.city, b.city, a.temp - b.temp
  from temps as a, temps as b where a.city < b.city;

select name, 60*abs(latitude-38) as distance
       from cities where name != "Berkeley" order by -longitude;

select cities.name as name, distance, longitude
       from cities, distances where cities.name = distances.name;
