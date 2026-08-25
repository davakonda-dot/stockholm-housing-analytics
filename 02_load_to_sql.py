import pandas as pd
from sqlalchemy import create_engine

# Reading file locally from the project folder
FILE_PATH = "listings.csv.gz"
print("1. Reading local Stockholm dataset...")

# Unpacking gzip files
raw_data = pd.read_csv(FILE_PATH, compression='gzip', low_memory=False)
print(f"Success! Read {raw_data.shape} rows and {raw_data.shape} columns.")

# 2. Connection to SQL
DATABASE_URL = "postgresql://postgres:root@localhost:5432/stockholm_housing"
engine = create_engine(DATABASE_URL)

print("2. Writing data to PostgreSQL table 'raw_listings'...")
raw_data.to_sql('raw_listings', engine, if_exists='replace', index=False)

print(" DONE! Everything is successfully loaded into database!")