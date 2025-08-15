#  data/ — Raw Match Data

This folder contains the **original, unprocessed CSV files** downloaded from [Kaggle](https://www.kaggle.com/datasets/panaaaaa/english-premier-league-and-championship-full-dataset). These files serve as the **starting point** for all analysis in this project and are used as the base layer in the Medallion architecture.

---

##  Data Source

- **Dataset:** [English Premier League and Championship Full Dataset](https://www.kaggle.com/datasets/panaaaaa/english-premier-league-and-championship-full-dataset)
- **Author:** [@panaaaaa](https://www.kaggle.com/panaaaaa)
- **License:** Open data for non-commercial and educational use
- **Leagues Covered:**  
  - Premier League  
  - Championship  
- **Time Period:** 1993/94 – 2024/25 (Mid Season)

---

##  Files in This Folder

| File Name            | Description                         |
|---------------------|-------------------------------------|
| `England CSV.csv`    | Premier League match data (raw)     |
| `England 2 CSV.csv`  | Championship match data (raw)       |

>  These files are in **original format**. Any data cleaning, transformation, or structuring is performed in the Bronze Layer scripts. These are treated as **read-only source data**.

---

##  Description of Dataset

The dataset contains thousands of historical match records from both the Premier League and the Championship. Each row represents a match and includes **25+ key variables** such as team names, goals, shots, fouls, corners, cards, and referee information.

This data enables rich analysis across seasons, teams, and competitions.

###  Key Columns

| Column Name      | Description                                 |
|------------------|---------------------------------------------|
| `Date`           | Match date (DD/MM/YYYY)                     |
| `Season`         | Football season (e.g., 2021/22)             |
| `League`         | Competition name (Premier League or Championship) |
| `HomeTeam`       | Name of the home team                       |
| `AwayTeam`       | Name of the away team                       |
| `FTH Goals`      | Full-Time Home Goals                        |
| `FTA Goals`      | Full-Time Away Goals                        |
| `FT Result`      | Full-Time Result (H/D/A)                    |
| `HTH Goals`      | Half-Time Home Goals                        |
| `HTA Goals`      | Half-Time Away Goals                        |
| `HT Result`      | Half-Time Result                            |
| `H Shots`        | Shots by the home team                      |
| `A Shots`        | Shots by the away team                      |
| `H SOT`          | Home Shots on Target                        |
| `A SOT`          | Away Shots on Target                        |
| `H Fouls`        | Fouls committed by home team                |
| `A Fouls`        | Fouls committed by away team                |
| `H Corners`      | Corners won by home team                    |
| `A Corners`      | Corners won by away team                    |
| `H Yellow`       | Yellow cards for home team                  |
| `A Yellow`       | Yellow cards for away team                  |
| `H Red`          | Red cards for home team                     |
| `A Red`          | Red cards for away team                     |
| `Referee`        | Match referee name                          |
| `Display_Order`  | Index or match ordering indicator           |

---

##  Notes

- These files are **raw and untouched** — no cleaning or formatting has been applied here.
- Any transformation is done in the `scripts/01_Bronze/` layer.
- Keep this folder as read-only to ensure data traceability and reproducibility.

---

##  References

- [Kaggle Dataset](https://www.kaggle.com/datasets/panaaaaa/english-premier-league-and-championship-full-dataset)
- [Premier League Official Site](https://www.premierleague.com/stats)
- [EFL Championship](https://www.efl.com/clubs-and-competitions/sky-bet-championship/)
