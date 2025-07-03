import pandas as pd

# Path to your CSV file
file_path = r"C:\Users\Morobang\Documents\GitHub\English Premier League & Championship Analysis\data\England CSV.csv"

# Read the CSV into a DataFrame
df = pd.read_csv(file_path)

# Show the first 5 rows (to verify structure)
print("📄 First 5 Rows:")
display(df.head())

# Filter for HomeTeam = Everton and AwayTeam = Charlton
filtered_df = df[(df['Home Team'] == 'Everton') & (df['Away Team'] == 'Charlton')]

# Show matching rows
print("\n⚽ Matches where Everton was home and Charlton was away:")
display(filtered_df)
