import pandas as pd
from sqlalchemy import create_engine

df = pd.read_excel('music.xlsx')
e = create_engine('postgresql://postgres:12345@localhost:5432/mydatabase')
df.to_sql('extractedTable', e)