# Architecture and Pipeline

## Current Architecture

This repository currently implements a SQL-only data pipeline with the following layers:

- `sql/01_create_database.sql` - Database provisioning
- `sql/02_create_financial_tasks_table.sql` - Schema creation
- `sql/03_load_financial_tasks.sql` - Data ingestion
- `sql/04_financial_analysis.sql` - Analytical queries and formula execution
- `reference/financial_modeling_questions.pdf` - Reference assessment documentation
- `reference/financial_modeling_questions.pdf` - Reference assessment documentation

## Recommended Architecture for Production

A production-ready data engineering pipeline typically includes:

1. **Source ingestion**
   - Raw financial data ingestion from external sources or landing files.
   - Use an ETL/ELT framework to centralize ingestion logic.

2. **Staging layer**
   - Temporary storage for raw records before transformation.
   - Data quality checks and schema validation happen here.

3. **Transform layer**
   - Create normalized and curated tables for business use.
   - Apply financial formulas and business logic consistently.

4. **Analytics layer**
   - Reports, dashboards, and model-ready datasets.
   - Maintain performance with partitioning, indexes, and aggregate tables.

5. **Orchestration and deployment**
   - Schedule and manage workflows using Airflow, dbt, Azure Data Factory, or a similar scheduler.
   - Include CI/CD for schema changes, data tests, and deployment.

## Data Flow Diagram

```
Raw Source -> Staging -> Transform -> Analytics
```

## Suggested Improvements

- Add a `src/` folder for transformation logic and orchestration scripts.
- Add a `tests/` folder for data validation and SQL regression tests.
- Add a `config/` folder for environment-specific database settings.
- Add `docs/` artifacts for lineage, glossary, and business requirements.

## Governance

- Capture data lineage for each table and transformation.
- Track schema changes through version-controlled SQL or migration tools.
- Establish data quality rules and threshold alerts.
