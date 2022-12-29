

import pandas as pd

url = 'https://stats.espncricinfo.com/ci/engine/records/averages/batting.html?class=6;id=2022;type=year'

all_tables = pd.read_html(url)

df = all_tables[0].iloc[::2]

df.to_csv('Espncricinfo.csv')


