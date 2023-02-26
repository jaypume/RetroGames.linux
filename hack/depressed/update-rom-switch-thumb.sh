#!/bin/bash

source "$ROOT_PATH/hack/config.sh"

# 可以根据这个脚本来制作自己的合集
copy_thumb_to_switch() {
    platform="Nintendo Switch"
    source_thumbnails_path="$ROOT_PATH/emulators/RetroArch/$platform/RetroArch.Full/thumbnails"
    target_thumbnails_path="$ROOT_PATH/emulators/RetroArch/$platform/RetroArch.Test/thumbnails"
    rm -rf "$target_thumbnails_path" && mkdir -p "$target_thumbnails_path"

    # "Nintendo - GBA" in thumbnails is not symbolic link, so here add '-p'
    ln -rs "$source_thumbnails_path"/* "$target_thumbnails_path/"
}

copy_thumb_to_switch
