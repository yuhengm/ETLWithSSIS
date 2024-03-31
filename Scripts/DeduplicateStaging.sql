WITH RankedRecords AS (
    SELECT 
      *, 
      ROW_NUMBER() OVER (
        PARTITION BY UserID 
        ORDER BY 
          RegistrationDate
      ) AS Rank 
    FROM 
      [KoreAssignment_Yuheng_Miao].[dbo].[Testing Table]
) 
DELETE FROM 
    RankedRecords 
WHERE 
    Rank > 1;
