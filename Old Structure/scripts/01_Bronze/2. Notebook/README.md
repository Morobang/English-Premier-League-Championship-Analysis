# England.ipynb - Analysis of English Premier League & Championship Data

This notebook combines, cleans, and analyzes data from two CSV files containing information about English Premier League and Championship matches. Below is a summary of the steps performed:

## Steps Performed

### 1. Import Necessary Libraries
- Imported `pandas` for data manipulation.
- Imported `numpy`, `scipy`, `seaborn`, and `matplotlib` for statistical analysis and visualization.

### 2. Load CSV Files
- Loaded two datasets:
  - `England CSV.csv`
  - `England 2 CSV.csv`

### 3. Combine Datasets
- Combined the two datasets row-wise using `pd.concat()`.

### 4. Save Combined Dataset
- Saved the combined dataset as `England Combined CSV.csv`.

### 5. Remove Duplicates
- Removed duplicate rows from the combined dataset.

### 6. Handle Missing Values
- Checked for missing values in each column.
- Filled missing values:
  - Numeric columns (`float64`, `int64`) were filled with the column mean.
  - Non-numeric columns were filled with the column mode.

### 7. Convert Data Types
- Converted specific `float64` columns to `int64` to ensure consistency:
  - Columns like `HTH Goals`, `HTA Goals`, `H Shots`, `A Shots`, etc.

### 8. Save Cleaned Dataset
- Saved the cleaned dataset as `England Cleaned CSV.csv`.

### 9. Exploratory Data Analysis (EDA)
Performed EDA on the cleaned dataset:
1. **Basic Statistics**:
   - Displayed summary statistics for numeric columns using `.describe()`.

2. **Value Counts**:
   - Displayed value counts for categorical columns.

3. **Correlation Matrix**:
   - Identified numeric columns and plotted a heatmap of their correlation matrix.

4. **Distribution of Goals**:
   - Plotted the distribution of full-time home and away goals using histograms.

5. **Goals Over the Years**:
   - Converted the `Date` column to datetime format and plotted the total goals scored per year.

## Outputs
- Combined Dataset: `England Combined CSV.csv`
- Cleaned Dataset: `England Cleaned CSV.csv`
- Visualizations:
  - Correlation heatmap.
  - Distribution of goals scored.
  - Goals scored over the years.

## How to Use
1. Open `England.ipynb` in Jupyter Notebook or any compatible environment.
2. Run the cells sequentially to reproduce the analysis.
3. Review the outputs and visualizations for insights.

## Requirements
Install the following Python libraries:
```bash
pip install pandas numpy scipy seaborn matplotlib
```
