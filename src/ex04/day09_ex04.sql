create or replace function fnc_persons_female()
RETURNS table (id bigint, name varchar, age int, gender varchar, address varchar)
AS 
$BODY$
    select id, name, age, gender, address 
    from person
    WHERE gender = 'female';
$BODY$
LANGUAGE SQL;

create or replace function fnc_persons_male()
RETURNS table (id bigint, name varchar, age int, gender varchar, address varchar)
AS 
$BODY$
    select id, name, age, gender, address 
    from person
    WHERE gender = 'male';
$BODY$
LANGUAGE SQL;