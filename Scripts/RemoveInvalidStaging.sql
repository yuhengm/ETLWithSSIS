INSERT INTO err.Users (UserID, FullName, Age, Email, RegistrationDate, LastLoginDate, PurchaseTotal) 
SELECT 
    UserID, 
    FullName, 
    Age, 
    Email, 
    RegistrationDate, 
    LastLoginDate, 
    PurchaseTotal 
FROM stg.Users
WHERE 
    UserID IS NULL
    OR FullName IS NULL
    OR Age IS NULL
    OR Email IS NULL
    OR RegistrationDate IS NULL
    OR LastLoginDate IS NULL
    OR PurchaseTotal IS NULL;
GO

DELETE FROM 
    stg.Users
WHERE 
    UserID IS NULL
    OR FullName IS NULL
    OR Age IS NULL
    OR Email IS NULL
    OR RegistrationDate IS NULL
    OR LastLoginDate IS NULL
    OR PurchaseTotal IS NULL;
