# Computational Financial Modeling

## Project Overview

This repository demonstrates a small-scale financial data engineering pipeline built on Microsoft SQL Server. It includes database provisioning, schema creation, sample data ingestion, and analytical formula questions for financial modeling tasks.

## Business Context

The project is designed for financial engineering use cases such as interest calculations, compounding growth, hire purchase installments, inflation projections, depreciation modeling, and effective annual rate analysis.

## Repository Structure

- `sql/01_create_database.sql` - Creates the `FinancialEngineeringDB` database if it does not exist.
- `sql/02_create_financial_tasks_table.sql` - Defines the `FinancialTasks` table and enforces decimal precision for financial accuracy.
- `sql/03_load_financial_tasks.sql` - Loads sample financial task records used for analysis and modeling.
- `sql/04_financial_analysis.sql` - Contains practical assessment query answers and implementation examples for financial formulas.
- `reference/financial_modeling_questions.pdf` - The original assessment question set for reference.

## How to Run

1. Open Microsoft SQL Server Management Studio (SSMS) or use `sqlcmd`.
2. Run `sql/01_create_database.sql` to create the target database.
3. Run `sql/02_create_financial_tasks_table.sql` to build the table schema.
4. Run `sql/03_load_financial_tasks.sql` to insert sample records.
5. Run `sql/04_financial_analysis.sql` to execute the financial calculations.

Example command using `sqlcmd`:

```powershell
sqlcmd -S localhost -i "sql\01_create_database.sql"
sqlcmd -S localhost -i "sql\02_create_financial_tasks_table.sql"
sqlcmd -S localhost -i "sql\03_load_financial_tasks.sql"
sqlcmd -S localhost -i "sql\04_financial_analysis.sql"
```

## Data Model

`FinancialTasks`
- `TaskID` (INT, Primary Key)
- `ModelName` (VARCHAR(100), NOT NULL)
- `Principal` (DECIMAL(19,4))
- `AnnualRate` (DECIMAL(19,4))
- `TermYears` (INT)
- `Frequency` (INT, DEFAULT 1)

Design rationale:
- `DECIMAL(19,4)` ensures high-precision financial calculations.
- The schema is intentionally simple for a teaching/assessment pipeline, but production-ready patterns are noted below.

## Data Engineering Standards Applied

- Idempotent SQL scripting: each script can be rerun without creating duplicate objects.
- Explicit schema definitions and data types.
- Sample dataset includes multiple financial formulas and frequency scenarios.
- Documentation captures the execution process and data model.

## Contribution

If you want to extend this project, consider adding:

- A Python or Spark-based ingestion pipeline.
- Automated schema migrations.
- Additional financial data sources and batch load logic.
- A `docs/` folder containing data lineage, source-to-target mapping, and PM/analytics notes.

