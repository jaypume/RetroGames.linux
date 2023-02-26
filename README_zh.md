# RetroGames



## 这个可以干什么

- 管理跨平台的怀旧游戏。运行平台包括：    
    - Android
    - Apple IOS
    - Nintendo Switch
    - Sony PSV
    - Windows
- 添加游戏后，脚本自动更新游戏列表和缩略图。
- 基于git-annex实现同一份ROM只保留单份拷贝。
- Switch自动更新拼音目录（因为Switch不支持中文名怀旧游戏文件）

## 为什么要做这个？
- 管理混乱，当前怀旧游戏ROM的管理混乱，没有版本的概念，尤其是中文游戏ROM。
- 无法协作，不同的怀旧游戏爱好者维护着自己的列表，每个人维护的游戏都不全。
- 浪费空间，重复的ROM文件存储浪费空间
- 无法跨平台，比如我希望在Switch、IOS上等各个平台玩耍，ROM文件、缩略图、列表的迁移都需要大量工作。





## 使用教程
如果你仅仅需要拷贝游戏到自己的游戏平台上的话。

0. 安装模拟器 
可以去如下地址寻找对应平台的RetroArch模拟器
```
https://buildbot.libretro.com/stable/
```

1. 下载游戏包，解压到'.git/annex/objects/'

```
由于游戏ROM涉及版权，暂时无法放在这里。
```

2. 拷贝到对应机器SD卡
```
rsync -aL './emulators/RetroArch/Nintendo Switch/RetroArch.Full'  '/Volumes/SDCard'
```
`-aL`表示会把符号链接的原始内容进行拷贝，而不是符号链接本身。


## 可以实现什么样的效果？(TODO)
### Windows
### Nintendo Switch
### Sony PSV
### Apple IOS
### Android


## 更新游戏教程
如果你需要自行添加游戏ROM并更新列表的话。
### 新ROM增加或改名后怎么办？
比如如果更新了PSP文件名和缩略图文件名的话：
1. 删除CSV中的PSP.csv
2. 执行 `zsh hack/update-playlists.sh`

### 如果更新了Switch咋办？
1. `bash hack/update-switch.sh`

## 待办

<!-- [-] 在-和·前后添加空格， -->
- [x] GBA几个文件改名
- [x] 自动更新Switch ROM文件夹（如果改名了的话）
- [x] 不用保留unsorted的csv

- [x] 增加Switch列表，
- [ ] CSV英文中有逗号... 待修改分隔符
- [ ] 封面中的中文改怎么修改？
- [ ] .Test合集等自动化
- [ ] NeoGeo改成咸鱼的ROM
      rom/Sega/1988 - MD/_source/MD.老街巷子游戏厅_咸鱼
- [ ] 清理: N64咸鱼文件夹，因为里面有很多cmd等文件。
- [ ] 编写天马 -> RA格式的转换
    - Nintendo - N64
    - Nintendo - NDS
    - Sega - Naomi
    - Sega - Saturn
    - SNK - NGPC

- [ ] 思考文件夹类型的rom
    - 中文名/xx.cue,xx.bin
    - 中文名/xxx.zip
    - 中文名/xxx.zip 一堆系列的，NEOGEO，要改成咸鱼

- [ ] 增加RetroArch每种平台的图标
- [ ] 优化cp命令
    - 图形界面
    - 展示拷贝进度条。
- [ ] 添加retroarch.cfg版本管理
- [ ] 添加存档同步方案/saves/states
