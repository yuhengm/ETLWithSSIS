# ETLWithSSIS

This project is the Technical Assessment for KORE Junior ETL/SSIS Engineer role. The objective is to develop an ETL process using SSIS that moves data from a CSV file to a production SQL Server table via a staging table. 

## Setup Instructions

### Prerequisite

1. Windows machine
2. [SQL Server Developer Edition](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
3. [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
4. [Visual Studio 2022](https://learn.microsoft.com/en-us/visualstudio/install/install-visual-studio?view=vs-2022)
5. [SQL Server Data Tools (SSDT) extension on Visual Studio](https://learn.microsoft.com/en-us/sql/ssdt/download-sql-server-data-tools-ssdt?view=sql-server-ver16)

### Database Setup

Open SSMS, connect to the SQL Server Instance on your machine, and execute [SQL query](Scripts/StartQuery.sql) to create `KoreAssignment_Yuheng_Miao` database, schema, and tables.

Note down `server name`, it will be needed to configure ETL pipeline.

### ETL Pipeline Execution

Open [SSIS solution](ETLWithSSIS.sln) in Visual Studio as an Integration Services Project, open `Package.dtsx` file in the main panel, and click `Start` above the workspace. The data will be extracted from [CSV file](source.csv), staged into `stg.Users` table, cleaned and inserted/upserted into `prod.Users` table.

Database output from my pipeline run can be found [here](Resources/database-backup.bacpac).

## Future Improvements

1. Use environment variables or package parameters in conjunction with SSIS catalog environments for dynamic configuration of connection managers and variables. 
2. More comprehensive error handling for invalid raw data. Right now this project only have error output tables during data casting, deduplication, and data cleaning. More error logging.
3. Consider normalizing `Users` table so that one user is not necessarily bound to one email, for example.
4. Switch from local machine to cloud for larger projects. 
5. ...