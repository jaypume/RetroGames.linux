#!/bin/zsh
# TODO: may need to move zsh to bash

ROOT_PATH=$(git rev-parse --show-toplevel)
source "$ROOT_PATH/hack/config.sh"

update_sorted_csv() {
    lines=
    # _dir_rom: ".../@ROM/Nintendo - GBA"
    for f in "$_dir_rom"/*; do
        #如果是目录的话，则表示还有下一级目录。
        if [[ -f "$f"/menu.m3u ]]; then
            rom_name=$(basename "$f")
            rom_path=$(basename "$f")/menu.m3u
            rom_ext=.m3u
            echo $rom_path
            #只把rom_name转换为拼音
            if [[ $_dir_rom == *ALL ]]; then
                # if it is end with "ALL", it shows that all filenames are in Englinsh.
                rom_name_py="$rom_name"
            else
                # TODO: 换用更快速的go-pinyin版本; Switch 估计这里会有bug
                # Chinese filename included, need to transfer to pinyin
                rom_name_py=$(echo $(pypinyin -s zhao "$rom_name") | awk '{$1=$1};1')
            fi
            # should no space here
            lines+="$rom_name,$rom_path,$rom_name_py"$'\n'
            
        elif [[ -d "$f" ]]; then
            # boot_file is like xx.zip, xx.cue, cc.lst
            boot_file=$(find "$f" -regextype posix-egrep -regex '.*\.(zip|chd|cue|cdi|gdi|lst|bin)' | head -n 1)
            rom_name=$(basename "$f")
            rom_path=$rom_name/$(basename "$boot_file")
            echo "$rom_path"
            # #只把title转换为拼音
            if [[ $_dir_rom == *ALL ]]; then
                # if it is end with "ALL", it shows that all filenames are in Englinsh.
                rom_name_py="$rom_name"
            else
                # Chinese filename included, need to transfer to pinyin
                rom_name_py=$(echo $(pypinyin -s zhao "$rom_name") | awk '{$1=$1};1')
            fi
            # should no space here
            lines+="$rom_name,$rom_path,$rom_name_py"$'\n'
        else
            rom_path=$(basename "$f")
            rom_ext="${rom_path##*.}"
            rom_name="${rom_path%.*}"
            echo "$rom_path"
            #只把rom_name转换为拼音
            if [[ $_dir_rom == *ALL ]]; then
                # if it is end with "ALL", it shows that all filenames are in Englinsh.
                rom_name_py="$rom_name"
            else
                # TODO: 换用更快速的go-pinyin版本
                # Chinese filename included, need to transfer to pinyin
                rom_name_py=$(echo $(pypinyin -s zhao "$rom_name") | awk '{$1=$1};1').$rom_ext
            fi
            # should no space here
            lines+="$rom_name,$rom_path,$rom_name_py"$'\n'
        fi
    done
    echo -n "$lines" >"$csv_file".unsort.csv
    sorted="$(sort -k 3 -t ',' "$csv_file".unsort.csv)"
    echo "$sorted" >"$csv_file.csv"
    rm -f "$csv_file".unsort.csv
}

update_playlists_from_csv() {
    # A line in csv file is like:
    # 龙珠大冒险.gba, long zhu da mao xian
    lines=""
    while IFS=',' read -r rom_name rom_path rom_name_py; do
        echo "$rom_name"
        # 在Windows上斜杠也是能工作的，可以删掉下面注释的代码
        # if [ "$platform" = "Windows" ]; then
        #     rom_path="${rom_path//\//\\\\}"
        # fi
        # TODO: 如果是Swtich, 下面这行要改为rom_name_py
        lines+=$(jq -n -c --arg path "$prefix/$emulator/$rom_path" \
            --arg label "$rom_name" \
            --arg core_path "" \
            --arg core_name "" \
            --arg crc32 '00000000|crc' \
            --arg db_name "$emulator.lpl" \
            '$ARGS.named')
    done < <(tail -n +1 "$csv_file.csv")
    lines_json=$(jq -s '.' <<<$lines)

    # TODO，后续可以添加默认的core：防止被绝对路径覆盖；省掉默认配置参数
    # The final json in *.lpl playlists file.
    lpl_json=$(jq -n --arg version "1.5" \
        --arg default_core_path "" \
        --arg default_core_name "" \
        --arg label_display_mode 0 \
        --arg right_thumbnail_mode 1 \
        --arg left_thumbnail_mode 0 \
        --arg sort_mode 2 \
        --argjson items "$lines_json" \
        '$ARGS.named')

    # Then output it to for example xx/playlists/Nintendo - GBA.lpl
    echo "$lpl_json" >"$_dir_lpl/$emulator.lpl"
}

update_one_platform_one_emulator() {
    platform=$1 # For example: Android, Apple IOS
    emulator=$2 # For example: Nintendo - GBA
    prefix=$3
    _dir=$ROOT_PATH/emulators/RetroArch/$platform/RetroArch.Full
    _dir_rom=$_dir/@ROM/$emulator
    _dir_csv=$ROOT_PATH/emulators/RetroArch/_base_/RetroArch/CSV
    _dir_lpl=$_dir/playlists
    csv_file=$_dir_csv/$emulator
    mkdir -p "$_dir_csv"
    mkdir -p "$_dir_lpl"

    # if csv is existing, skip this emulator.
    if [ -f "$csv_file".csv ]; then
        echo "$csv_file".csv" is existing, skip"
    else
        update_sorted_csv
    fi
    update_playlists_from_csv
}

update_all_platform_one_emulator() {
    for platform_and_prefix in "${platforms[@]}"; do
        platform=$(echo $platform_and_prefix | cut -d',' -f 1)
        prefix=$(echo $platform_and_prefix | cut -d',' -f 2)
        echo "=========================Starting to udpate "$platform : $emulator, ${prefix}
        update_one_platform_one_emulator "$platform" "$emulator" "$prefix"
    done
}

update_all_platform_all_emulator() {
    for emulator in "${emulators[@]}"; do
        update_all_platform_one_emulator "$emulator"
    done
}

update_all_platform_all_emulator
