USE FinancialEngineeringDB;
GO

IF OBJECT_ID('dbo.FinancialTasks', 'U') IS NOT NULL
    DROP TABLE dbo.FinancialTasks;
GO

CREATE TABLE dbo.FinancialTasks (
    TaskID      INT PRIMARY KEY,
    ModelName   VARCHAR(100) NOT NULL,
    Principal   DECIMAL(19, 4),   
    AnnualRate  DECIMAL(19, 4),   
    TermYears   INT,
    Frequency   INT DEFAULT 1     
);
GO