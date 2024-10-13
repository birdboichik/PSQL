CREATE TABLE IF NOT EXISTS startedTable AS 
SELECT * FROM extractedTable WITH NO DATA;

CREATE OR REPLACE FUNCTION transform_data(start_date DATE, end_date DATE)
RETURNS VOID AS $$
BEGIN
    INSERT INTO startedTable
    SELECT *
    FROM extractedTable
    WHERE "Report_date" BETWEEN start_date AND end_date
    AND "Report_date" BETWEEN '2023-01-01' AND '2023-12-31'
    AND "Report_date" IS NOT NULL
    AND COALESCE("userID", "Track", artist, genre, "City", CAST(time AS text), "Weekday") IS NOT NULL;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM startedTable;