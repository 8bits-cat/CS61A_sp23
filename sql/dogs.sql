-- Lecture 1: select, create, join

-- Parents
create table parents as
  select "abraham" as parent, "barack" as child union
  select "abraham"          , "clinton"         union
  select "delano"           , "herbert"         union
  select "fillmore"         , "abraham"         union
  select "fillmore"         , "delano"          union
  select "fillmore"         , "grover"          union
  select "eisenhower"       , "fillmore";

-- Children of Abraham
select child from parents where parent = "abraham";

-- Fillmores
select parent from parents where parent > child;

-- Grandparents
create table grandparents as
  select a.parent as grandog, b.child as granpup
    from parents as a, parents as b
    where b.parent = a.child;

-- Alphabetical grandchildren
select * from grandparents where grandog < granpup;

-- Siblings
select a.child, b.child from parents as a, parents as b
  where a.parent = b.parent and a.child < b.child;

-- Fur
create table dogs as
  select "abraham" as name, "long" as fur union
  select "barack"         , "short"       union
  select "clinton"        , "long"        union
  select "delano"         , "long"        union
  select "eisenhower"     , "short"       union
  select "fillmore"       , "curly"       union
  select "grover"         , "short"       union
  select "herbert"        , "curly";

-- Fur ordering
select * from dogs order by fur;

-- Parents of curly dogs
select parent from parents, dogs where child = name and fur = "curly";

-- Grandpas with the same fur as their granpups
select grandog, granpup, c.fur from grandparents, dogs as c, dogs as d
  where grandog = c.name  and
        granpup = d.name and
        c.fur = d.fur;


