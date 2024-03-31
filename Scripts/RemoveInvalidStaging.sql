-- Check and create err.Users table if it does not exist
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'err.Users') AND type in (N'U'))
BEGIN
    CREATE TABLE err.Users (
        ErroutID INT IDENTITY(1,1) PRIMARY KEY,
        UserID INT,
        FullName NVARCHAR(255),
        Age INT,
        Email NVARCHAR(255),
        RegistrationDate DATE,
        LastLoginDate DATE,
        PurchaseTotal FLOAT
    );
END
GO

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
