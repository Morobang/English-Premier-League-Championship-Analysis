#  English Premier League & Championship Analysis

![Premier League Logo](https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png)

A comprehensive data analytics project exploring over 30 years of match results and statistics from the English Premier League (EPL) and EFL Championship (1993/94 – 2024/25 Mid Season). The analysis covers thousands of matches using a structured approach built on SQL, Python, and Power BI.

This repository serves as the central hub for the project, containing scripts, datasets, visualizations, and documentation — all organized following a modern data architecture and engineering workflow.

---

## Project Overview & Structure


This project is built to transform raw English football match data into structured, analytical models using a **layered data architecture** and modern data tooling.

-  **Primary Focus:** SQL-driven data transformation and modeling (Bronze → Silver → Gold)
-  **Support Tools:** Python for exploratory analysis and Power BI for dashboards
-  **Objective:** Develop a reusable analytics workflow to explore trends, team performance, referee patterns, and anomalies over a 30+ year span

Each major folder in the project has a dedicated `README.md` that explains its purpose in detail.

```

EPL\_Analysis/
├── data/                    # Raw and cleaned datasets (EPL & Championship)
│   ├── epl\_matches\_raw\.csv
│   └── epl\_teams\_processed.csv

├── scripts/                 # SQL and Python scripts for layered ETL
│   ├── 01\_Bronze/           # Ingest raw CSVs into staging tables
│   ├── 02\_Silver/           # Clean, transform, validate data
│   ├── 03\_Gold/             # Create analytical models (facts, dimensions)
│   └── 04\_Utils/            # Reusable Python scripts, SQL queries, metadata

├── notebooks/               # Jupyter notebooks for interactive data exploration
│   ├── 1\_Data\_Cleaning.ipynb
│   └── 2\_Visual\_Analysis.ipynb

├── powerbi/                 # Power BI dashboards and exported reports
│   └── epl\_dashboard.pbix

├── docs/                    # Project documentation and research notes

└── README.md                # Main project overview (you’re here)
```
---

## Project Goals

- Clean and preprocess the dataset
- Analyze trends in match results, team performance, and referee behavior
- Identify outliers, rivalries, and performance shifts over time
- Visualize findings using Python & Power BI
- Write reusable SQL queries for key insights

---



## Tools & Technologies

The project is powered by the following tools:

- **SQL Server** – Core data transformation and modeling (main tool)
- **Python (Pandas, Seaborn, Matplotlib, Plotly)** – Data exploration & visualization
- **Jupyter Notebooks** – Interactive analysis and documentation
- **Power BI** – Interactive dashboards and business intelligence reporting

**Tool Setup Guide:**  
All tool installation steps are documented in a separate repo:  
[DevToolkit Repository](https://github.com/Morobang/DevToolkit)

- [Python Setup](https://github.com/Morobang/DevToolkit/tree/main/Python)
- [Microsoft SQL Server](https://github.com/Morobang/DevToolkit/tree/main/Microsoft%20SQL%20Server)
- [SQL Scripts](https://github.com/Morobang/DevToolkit/tree/main/SQL)
- [Power BI Setup](https://github.com/Morobang/DevToolkit/tree/main/Power%20Bi)
- [Jupyter Setup](https://github.com/Morobang/DevToolkit/tree/main/Jupyter)

---

## Data Architecture – Medallion Model

The project follows a **Medallion Architecture** with three layers of data:

- **Bronze Layer**: Raw data ingested from CSV files
- **Silver Layer**: Cleaned and structured tables with validated types and formats
- **Gold Layer**: Final analytical models (fact and dimension tables) for analysis and reporting

This approach enables consistent data quality, maintainability, and traceability across the data lifecycle.

---


## 🧭 Project Roadmap

| Phase                | Status   | Description |
|---------------------|----------|-------------|
| Setup Repository    | ✅ Done  | Project structure and tooling organized |
| Load Raw Data       | ✅ Done  | CSVs imported and staged in Bronze Layer |
| Bronze Layer        | ✅ Done  | Initial staging with minimal transformation |
| Silver Layer        | 🔄 WIP   | Cleaning, validation, schema alignment |
| Gold Layer          | 🔄 WIP   | Creating fact and dimension tables |
| Python Exploration  | 🔄 WIP   | Basic analysis and visualizations |
| Power BI Dashboard  | 🔄 Planned | Create interactive reports |
| Folder READMEs      | 🔄 Planned | Explain each section in detail |

---

## 📧 Contact

**Tshigidimisa Morobang**  
📧 morobangtshigidimisa@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/morobang-tshigidimisa-84172b26b)

---

> 📄 *For specific code, setup instructions, or detailed analysis — please refer to the README inside each folder.*
