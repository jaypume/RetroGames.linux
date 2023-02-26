# -*- coding: utf-8 -*-
import json

files = [
    'CPS1.lpl',
    'CPS2.lpl',
    'FC.lpl',
    'GBA.lpl',
    'GBC.lpl',
    'MAME.lpl',
    'MD.lpl',
    'NeoGeo.lpl',
    'ngp.lpl',
    'PCE.lpl',
    'PCE CD.lpl',
    'Sega - 32X.lpl',
    'SFC.lpl',
]


class Out:
    def __init__(self):
        self.version = "1.4"
        self.default_core_path = ""
        self.default_core_name = ""
        self.label_display_mode = 0
        self.right_thumbnail_mode = 0
        self.left_thumbnail_mode = 0
        self.sort_mode = 0
        self.items = []


class Item:
    def __init__(self):
        self.path = ''
        self.label = ''
        self.core_path = "DETECT"
        self.core_name = "DETECT"
        self.crc32 = ''
        self.db_name = ''


def handle(name, old_root, new_root):
    out = Out()
    with open(f'old/{name}', encoding='UTF-8') as file:
        lines = file.readlines()
        count = len(lines) // 6
        for i in range(count):
            item = Item()
            item.path = lines[6 * i + 0].strip('\n').replace(old_root, new_root)
            item.label = lines[6 * i + 1].strip('\n')
            item.db_name = f'{name}'
            out.items.append(item.__dict__)
        j = json.dumps(out.__dict__, ensure_ascii=False, indent=4, sort_keys=False)
        with open(f'new/{name}', 'w') as f:
            print(j, file=f)


if __name__ == '__main__':
    for ff in files:
        handle(ff, 'uma0:/ROM', 'ux0:/[PUJIE]/ROM')
