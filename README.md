# English Premier League & Championship Analysis
![Premier League Logo](https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png) 

A comprehensive data analytics project exploring over 30 years of match results and statistics from the English Premier League (EPL) and EFL Championship (1993/94 – 2024/25 Mid Season). The analysis covers thousands of matches using a structured approach built on SQL, Python, and Power BI.

This repository serves as the central hub for the project, containing scripts, datasets, visualizations, and documentation — all organized following a modern data architecture and engineering workflow.

---

##  About the Project

This project transforms raw football match data into structured, insightful information through a layered data architecture.

- **Primary focus:** SQL-based data transformation and modeling
- **Support tools:** Python (for visualizations & exploration), Power BI (for dashboards)
- **Goal:** Build reusable, modular workflows to analyze team performance, referee behavior, trends, and outliers in English football

Each section of the project is documented in its own folder with a dedicated `README.md` explaining its purpose.

---

##  Tools & Technologies

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

##  Project Structure Overview

Each folder in this repository includes a dedicated `README.md` to explain its purpose. Below is a high-level summary:

- `data/` – Raw and cleaned match datasets  
- `scripts/` – SQL scripts for all layers: Bronze, Silver, Gold  
- `notebooks/` – Python notebooks for analysis and visual exploration  
- `powerbi/` – Power BI dashboards and exported visuals  
- `04_Utils/` – Python scripts, reusable SQL files, and helper documentation  
- `docs/` – Additional documentation and reporting assets  

---

##  Project Roadmap

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

##  Contact

**Tshigidimisa Morobang**  
📧 morobangtshigidimisa@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/morobang-tshigidimisa-84172b26b)

---

>  *For specific code, setup instructions, or detailed analysis — please refer to the README inside each folder.*
