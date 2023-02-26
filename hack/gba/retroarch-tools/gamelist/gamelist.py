import re

import pandas as pd


def shortage(r):
    r = str(r).replace('.gba', '')
    names = []
    names.append(r)
    names.append(re.sub(r'(^.*)\s(.*)', r'\2', r))
    names.append(re.sub(r'(^.*)\s(.*)', r'\1', r))
    return names


def find_game(r, df_):
    names = shortage(r)
    print(f'names={names}')
    for name in names:
        loc = df_.loc[df_['中文名'].str.contains(name)]
        if loc is not None:
            print(df_[loc])
            return loc
    return None
    # return df_[loc]['编号'],


def add_to_csv():
    df_f = pd.read_csv('GBA.ZH.csv', header=None)
    df_l = pd.read_csv('GBA.ZH_EN.csv')
    df_l.fillna(value='', inplace=True)
    print(df_l.columns)

    indexes = []
    zh_name = []
    en_name = []

    for i, r in df_f.iterrows():
        find_game(r[0], df_l)
        # index, en, zh = find_game(r, df_l)
        # indexes.append(index)
        # zh_name.append(zh)
        # en_name.append(en)

    # df_f['编号'] = indexes
    # df_l['游戏名称'] = en_name
    # df_l['中文名'] = zh_name


if __name__ == '__main__':
    add_to_csv()
