# Enterprise Azure Data Migration: On-Prem SQL to ADLS Gen2

## Executive Summary
This project demonstrates a metadata-driven ETL framework built using Azure Data Factory to migrate data from on-premises SQL Server to Azure Data Lake Storage (ADLS Gen2).

The solution replaces hardcoded pipelines with a reusable, parameter-driven design that can scale to handle multiple tables without requiring code changes.

---

## Business Problem & Impact

### The Challenge
The organization had data stored in on-premises systems that was difficult to access for analytics. Existing extraction methods were slow and required manual effort whenever new tables needed to be onboarded.

### The Solution & Impact
- Reduced onboarding effort by allowing new tables to be ingested through simple metadata configuration instead of pipeline changes  
- Improved efficiency by implementing incremental (delta) loads instead of full data loads  
- Enabled secure data movement using Self-Hosted Integration Runtime (SHIR), avoiding exposure through public endpoints  

---

## Technical Overview & Architecture

### Pipeline Design

The solution uses a parent-child pipeline architecture:

1. **Parent Pipeline (PL_Parent_Master)**
   - Reads metadata from a control table  
   - Identifies tables to process  
   - Triggers child pipelines dynamically  

2. **Child Pipeline (PL_Child_Worker)**
   - Receives parameters like table name and load type  
   - Builds dynamic SQL queries  
   - Performs full or incremental load  
   - Loads data into ADLS  

---

## Data Flow

On-Prem SQL Server → Self-Hosted Integration Runtime → Azure Data Factory → ADLS Gen2

---

## Repository Structure

- /pipeline-json/  
  Contains JSON definitions for ADF pipelines  

- /sql-scripts/  
  Contains SQL queries used for full and incremental loads  

- /metadata/  
  Contains metadata table scripts  

- /linked-services/ and /datasets/  
  Contains connection and dataset configurations  

---

## How to Deploy & Run

1. Set up Azure Data Factory and ADLS Gen2  
2. Install Self-Hosted Integration Runtime in the source environment  
3. Create metadata table using scripts in /metadata/  
4. Import pipelines and datasets into ADF  
5. Trigger the parent pipeline to start ingestion  

---

## Key Learnings

- Built scalable ETL pipelines using Azure Data Factory  
- Implemented metadata-driven architecture  
- Designed incremental load using watermark logic  
- Improved pipeline reusability and maintainability  

---

## Author

Srinath Mahto  
Azure Data Engineer | ETL | SQL | Cloud