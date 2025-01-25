create table person_audit (
    created timestamp with time zone default CURRENT_TIMESTAMP not NULL,
    type_event char(1) DEFAULT 'I' not NULL CHECK (type_event IN ('I', 'U', 'D')),
    row_id bigint not NULL,
    name varchar,
    age int,
    gender varchar,
    address varchar
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$BODY$
BEGIN
	INSERT INTO person_audit(row_id, name, age, gender, address)
	VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
RETURN NULL;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit(); 

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');