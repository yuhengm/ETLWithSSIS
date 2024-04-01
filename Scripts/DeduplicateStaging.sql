WITH RankedRecords AS (
    SELECT 
      *, 
      ROW_NUMBER() OVER (
        PARTITION BY UserID 
        ORDER BY 
          RegistrationDate
      ) AS Rank 
    FROM 
      dbo.TestStaging
) 
DELETE FROM 
    RankedRecords 
WHERE 
    Rank > 1;
