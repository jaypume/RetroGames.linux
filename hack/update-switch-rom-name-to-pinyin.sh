#!/bin/bash

ROOT_PATH=$(git rev-parse --show-toplevel)
source "$ROOT_PATH/hack/config.sh"

update_one_emulator() {
    echo "start to update $emulator"
    while IFS=, read cn_name py_name; do
        from="$ROOT_PATH/$BASE_NS_PATH/@ROM/$emulator/$cn_name"
        to="$ROOT_PATH/$BASE_NS_PATH/@ROM/$emulator/$py_name"
        mv -v "$from" "$to"
    done <"$ROOT_PATH/$BASE_RA_PATH/CSV/$emulator.csv"
}

update_all_emulator() {
    for emulator in "${emulators[@]}"; do
        update_one_emulator "$emulator"
    done
}

update_all_emulator
