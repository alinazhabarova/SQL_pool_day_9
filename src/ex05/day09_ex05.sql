DROP FUNCTION fnc_persons_female();
DROP FUNCTION fnc_persons_male();

create or replace function fnc_persons(pgender varchar default 'female')
RETURNS table (id bigint, name varchar, age int, gender varchar, address varchar)
AS 
$BODY$
    select id, name, age, gender, address 
    from person
    WHERE gender = pgender;
$BODY$ 
LANGUAGE SQL;