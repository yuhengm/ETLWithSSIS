WITH RankedRecords AS (
    SELECT 
      *, 
      ROW_NUMBER() OVER (
        PARTITION BY UserID 
        ORDER BY 
          RegistrationDate
      ) AS Rank 
    FROM 
      stg.Users
) 
DELETE FROM 
    RankedRecords 
WHERE 
    Rank > 1;
