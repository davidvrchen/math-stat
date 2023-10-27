from datetime import date
import yfinance as yf

import pandas as pd

# Tickers list
# We can add and delete any ticker from the list to get desired ticker live data
ticker = yf.Ticker("BBBYQ")

# We can get data by our choice by giving days bracket
start_date = "2022-01-01"
end_date = "2023-01-01"


# Create a data folder in your current dir.
def SaveData(df, filename):
    df.to_csv("./data/" + filename + ".csv")


data = ticker.history(start=start_date, end=end_date)
dataname = "BBBYQ"
SaveData(data, dataname)
