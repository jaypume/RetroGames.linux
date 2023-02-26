import os
import pandas as pd

folder_list = ['Named_Boxarts', 'Named_Snaps', 'Named_Titles']


def handle(root, en_cn_csv):
    df = pd.read_csv(en_cn_csv)
    # exit(df.columns)
    for i, row in df.iterrows():
        print(row['游戏名称'], row['中文名_clean'])


    # for folder in folder_list:
    #     for file in os.path.join(root, folder):


if __name__ == '__main__':
    handle('Nintendo - Game Boy Advance', 'GBA.ZH_clean_EN.csv')
