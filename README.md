# Olympic ETL Project

## Overview
The "Olmpic ETL Project" project leverages data from Kaggle to perform in-depth ETL analysis of the Tokyo Olympics. The data is stored in a Git repository and processed using various **Azure** services including  **`Azure Storage`**, **`Data Factory`**, **`Databricks`**, and **`Synapse Analytics`**.

## Architecture
![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/architecture.png)  <br/> <br/>

## Features
- Data extraction and loading using **Azure Data Factory**.
- Data transformation using **Azure Databricks** and **Spark**.
- Storage and management of data in **Azure Synapse Analytics**.
- SQL queries for deriving business insights from the Olympic data.

### Prerequisites
- Access to the Kaggle dataset.
- An Azure account with required services (Storage, Data Factory, Databricks, Synapse Analytics).
- The dataset API in raw format.

### Setting Up the Project
1. Clone the repository from Git.
2. Access the raw data through the provided API.

### Data Extraction
1. Create Azure Storage.<br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/storage%20account.png)  <br/> <br/>

3. After creating a storage account, create container  <br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/container.png)  <br/> <br/>

4. Dictory as `raw data` and `transformed data`.<br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/directory.png)  <br/><br/>
   
5. Set up Azure Data Factory and create a pipeline. <br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/data%20factory.png)  <br/>
   
8. Validate and debug the data extraction process.

### Data Transformation and Load
1. Create a single node compute in Azure Databricks.<br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/databricks.png)  <br/><br/>
3. Configure a notebook to establish a connection between Databricks and the data.
4. Resolve any IAM role assignment issues for access.
5. Perform data transformation using Spark in the Databricks notebook.
   [Visit the Notebook](https://github.com/dshah98/Olympic-ETL-Project/blob/main/Tokyo%20Olympic%20Transformation.ipynb).
6. After data transformation you load back data to the storage file called transformed-data.

### Data Storage and Analysis
1. Set up Azure Synapse Analytics.
2. Create a database and store the transformed data in table form. <br/>
   ![alt Storage](https://github.com/dshah98/Olympic-ETL-Project/blob/main/images/synapse.png)  <br/><br/>
4. Execute SQL queries to meet business objectives related to the Tokyo Olympics data.
   [Visit the Synpanse SQL Query](https://github.com/dshah98/Olympic-ETL-Project/blob/main/Synapse%20SQL%20Query.sql).

## Data Sources
   The project uses data from Kaggle, accessed through an API in raw format.
   [Data from Github](https://github.com/dshah98/Olympic-ETL-Project/tree/main/data) - 
   [Kaggle](https://www.kaggle.com/datasets/arjunprasadsarkhel/2021-olympics-in-tokyo)


## Contact
   For questions or feedback, please reach out to [Portfolio](https://dshah98.github.io/).
