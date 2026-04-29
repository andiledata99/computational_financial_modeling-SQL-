
/* ZFinancial Engineering Assessment
   Database: Microsoft SQL Server (SSMS)
   Data Integrity Standard: GAAP / High-Precision Decimal
*/

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'FinancialEngineeringDB')
BEGIN
    CREATE DATABASE FinancialEngineeringDB;
END
GO