create table nouns as
    select "the dog" as phrase union
    select "the cat"           union
    select "the bird";

select subject.phrase || " chased " || object.phrase
       from nouns as subject, nouns as object
       where subject.phrase != object.phrase;

select subject.phrase || " chased " || object.phrase
       from nouns as subject, nouns as object
       where subject.phrase != object.phrase;

create table ands as
  select phrase from nouns union
  select first.phrase || " and " || second.phrase
         from nouns as first, nouns as second
         where first.phrase != second.phrase;

select subject.phrase || " chased " || object.phrase
       from ands as subject, ands as object
       where subject.phrase != object.phrase;
