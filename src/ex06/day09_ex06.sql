create or replace function fnc_person_visits_and_eats_on_date (
  	pperson varchar default 'Dmitriy', 
    pprice numeric default '500', 
    pdate date default '2022-01-08')
RETURNS table (name varchar)
AS 
$BODY$
begin
    return query select pizzeria.name 
    from pizzeria
    join menu on menu.pizzeria_id = pizzeria.id
    join person_visits on person_visits.pizzeria_id = pizzeria.id
    join person on person.id = person_visits.person_id
    where person.name = pperson and menu.price < pprice and visit_date = pdate;
end;
$BODY$ 
LANGUAGE PLPGSQL;