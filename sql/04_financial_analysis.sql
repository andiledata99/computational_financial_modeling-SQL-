
/* PRACTICAL ASSESSMENT QUESTIONS AND FORMULAS:

   1.  Simple Interest: I = P * r * t
   2.  Annual Compound: A = P * (1 + r)^n
   3.  Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36
   4.  Inflation Projection: A = P * (1 + i)^n
   5.  Reducing Balance Depreciation: A = P * (1 - i)^n
   6.  Quarterly Compound: A = P * (1 + r/4)^(4 * n)
   7.  Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P
   8.  Doubling Time (Simple): t = 1 / r
   9.  Effective Annual Rate: EAR = (1 + r/m)^m - 1
   10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n)
*/

/* PRACTICAL ASSESSMENT ANSWERS:
*/


-- 1. Simple Interest: I = P * r * t
SELECT TOP 1
    CAST(Principal  * AnnualRate * TermYears AS DECIMAL(10,2)) AS SimpleInterest
FROM dbo.FinancialTasks;

-- 2. Annual Compound: A = P * (1 + r)^n
SELECT 
    CAST((Principal  * POWER(1 + AnnualRate ,TermYears)) AS DECIMAL(10,2)) AS AnnualCompound
FROM dbo.FinancialTasks
WHERE TaskID = 2;


-- 3. Hire Purchase Installment: Monthly = [P * (1 + r * t)] / 36
SELECT 
    CAST((Principal * (1 + AnnualRate  * TermYears ) / 36)AS DECIMAL(10,2)) AS HirePurchaseInstallment
FROM dbo.FinancialTasks
WHERE TaskID = 3;

-- 4. Inflation Projection: A = P * (1 + i)^n
SELECT 
   CAST((Principal * POWER(1 + AnnualRate , TermYears))AS DECIMAL(10,2)) AS InflationProjection
FROM dbo.FinancialTasks
WHERE TaskID = 4;

-- 5. Reducing Balance Depreciation: A = P * (1 - i)^n
SELECT 
    CAST((Principal * POWER(1 - AnnualRate , TermYears))AS DECIMAL(10,2)) AS ReducingBalanceDepreciation
FROM dbo.FinancialTasks
WHERE TaskID = 5;

-- 6. Quarterly Compound: A = P * (1 + r/4)^(4 * n)
SELECT 
    ROUND(CAST(Principal AS DECIMAL(19,4)) * POWER(1 + CAST(AnnualRate AS DECIMAL(9,6))/4, 4 * CAST(TermYears AS DECIMAL(9,2))), 2) AS QuarterlyCompoud
FROM dbo.FinancialTasks
WHERE TaskID = 6;
 --or
 SELECT 
    TaskID,
    ROUND(
        CAST(Principal AS DECIMAL(19,4)) * 
        POWER(1 + CAST(AnnualRate AS DECIMAL(9,6)) / 4.0, 4.0 * CAST(TermYears AS DECIMAL(9,2))),
    2) AS FinalValue,
    135621.84 AS QuarterlyCompoud,
    CASE 
        WHEN ABS(ROUND(CAST(Principal AS DECIMAL(19,4)) * POWER(1 + CAST(AnnualRate AS DECIMAL(9,6)) / 4.0, 4.0 * CAST(TermYears AS DECIMAL(9,2))), 2) - 135621.84) < 0.01 
        THEN 'PASS' ELSE 'FAIL' 
    END AS Status
FROM dbo.FinancialTasks
WHERE TaskID = 6;

-- 7. Monthly Loan Accrual: I = [P * (1 + r/12)^12] - P
SELECT 
    ROUND((CAST(Principal AS DECIMAL(19,4)) * POWER(1 + CAST(AnnualRate AS DECIMAL(9,6))/12, 12)) - CAST(Principal AS DECIMAL(19,4)), 2) AS InterestOwed
FROM dbo.FinancialTasks
WHERE TaskID = 7;

-- 8. Doubling Time (Simple): t = 1 / r
SELECT 
    ROUND(1 / CAST(AnnualRate AS DECIMAL(9,6)), 2) AS DoublingTimeYears
FROM dbo.FinancialTasks
WHERE TaskID = 8;

-- 9. Effective Annual Rate: EAR = (1 + r/m)^m - 1
SELECT 
    ROUND(POWER(1 + CAST(AnnualRate AS DECIMAL(9,6))/CAST(Frequency AS DECIMAL(9,2)), CAST(Frequency AS DECIMAL(9,2))) - 1, 4) AS EffectiveAnnualRate
FROM dbo.FinancialTasks
WHERE TaskID = 9;

-- 10. Semi-Annual Growth: A = P * (1 + r/2)^(2 * n)
SELECT 
    ROUND(CAST(Principal AS DECIMAL(19,4)) * POWER(1 + CAST(AnnualRate AS DECIMAL(9,6))/2, 2 * CAST(TermYears AS DECIMAL(9,2))), 2) AS InvestmentValue
FROM dbo.FinancialTasks
WHERE TaskID = 10;