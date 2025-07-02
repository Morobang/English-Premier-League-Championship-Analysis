# **Bronze Layer Implementation Guide**  

## **📌 Overview**  
The **Bronze Layer** is the first stage in the data pipeline, responsible for **raw data ingestion** from CSV files into SQL Server with minimal transformations.  

### **✅ Key Features**  
1. **Raw Data Preservation** – Stores data exactly as sourced.  
2. **Fast Loading** – Uses SQL `BULK INSERT` for high-speed imports.  
3. **Simple Schema** – All columns stored as `VARCHAR(50)` for flexibility.  
4. **Error Handling** – SQL transactions ensure data integrity.  

---

## **📂 File Structure**  
```
data/  
├── England CSV.csv       # Premier League data  
├── England 2 CSV.csv    # Championship data  
```

---

## **⚙️ SQL Stored Procedure**  
### **`usp_Load_Bronze_England_Data`**  
**Purpose**: Loads CSV data into `Bronze.England_CSV` and `Bronze.England_2_CSV`.  

**Key Steps**:  
1. **Truncates** target tables before loading.  
2. **Bulk inserts** data from CSV files.  
3. **Transactional safety** (commit on success, rollback on failure).  

**Usage**:  
```sql
EXEC [dbo].[usp_Load_Bronze_England_Data];
```

---

## **🐍 Python’s Role in Bronze Layer**  
While SQL handles the heavy lifting, Python can assist with:  

### **1. File Validation (Pre-Load)**  
```python
import os

if not os.path.exists("data/England CSV.csv"):
    raise FileNotFoundError("Premier League CSV missing!")
```

### **2. Automated Execution**  
```python
import subprocess

subprocess.run([
    "sqlcmd",
    "-S", "DESKTOP-939GPCA",
    "-d", "English Premier League and Championship",
    "-Q", "EXEC usp_Load_Bronze_England_Data"
])
```

### **3. Logging & Monitoring**  
```python
import logging

logging.basicConfig(filename='bronze_load.log', level=logging.INFO)
logging.info(f"Data loaded at {datetime.now()}")
```

---

## **🔜 Next Steps (Silver Layer)**  
- **Data Cleaning** (fix missing values, standardize formats)  
- **Type Conversion** (convert `VARCHAR` to `DATE`, `INT`, etc.)  
- **Business Logic** (derive new metrics, apply transformations)  

---

## **📌 Summary**  
✔ **Bronze Layer = Raw, Fast, Unaltered Data**  
✔ **SQL `BULK INSERT` = Best for high-speed loading**  
✔ **Python = Pre-checks, automation, and logging**  

🚀 **Proceed to Silver Layer for transformations!**