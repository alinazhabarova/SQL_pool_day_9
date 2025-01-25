CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE (number INT)
AS 
$BODY$
BEGIN
    RETURN QUERY (
        WITH RECURSIVE fibonacci AS (
            SELECT 0 AS prev_n, 1 AS cur_n
            UNION ALL
            SELECT cur_n, prev_n + cur_n AS next_n
            FROM fibonacci
            WHERE pstop > cur_n
        )
        SELECT cur_n AS number FROM fibonacci
    );
END;
$BODY$ 
LANGUAGE plpgsql;
