# Import libraries
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Import Data
nba_df = pd.read_csv('C:\\Users\\Gabe\\Documents\\Bellevue University\\Data Visualizations\\Week 7 & 8\\ppg2008.csv')
print(nba_df.head())


[X,Y] = np.meshgrid(nba_df['PTS'], nba_df['MIN'])
fig, ax = plt.subplots(1,1)
Z = np.cos(X/2) + np.sin(Y/4)
ax.contour(X,Y,Z)
ax.set_title('Contour Plot of Points and Minutes in the NBA Season 2008')
ax.set_xlabel('Points Made by Players')
ax.set_ylabel('Amount of Minutes played by Players')
plt.show()
