#!/bin/zsh

# this scripts is just for test.

db=$1
dir_rom="../@ROM/$db",
dir_boxarts="../thumbnails/$db/Named_Boxarts"
dir_snaps="../thumbnails/$db/Named_Snaps"
dir_titles="../thumbnails/$db/Named_Titles"

function rename_test() {
    while IFS=',' read -r old_name new_name; do
        rename -n "s/$old_name/$new_name/" ../@ROM/$db/*
        rename -n "s/$old_name/$new_name/" ../thumbnails/$db/Named_Boxarts/*
        rename -n "s/$old_name/$new_name/" ../thumbnails/$db/Named_Snaps/*
        rename -n "s/$old_name/$new_name/" ../thumbnails/$db/Named_Titles/*
    done < <(tail -n +1 "$db.csv")
}

function rename_real_do() {
    while IFS=',' read -r old_name new_name; do
        rename -v "s/$old_name/$new_name/" ../@ROM/$db/*
        rename -v "s/$old_name/$new_name/" ../thumbnails/$db/Named_Boxarts/*
        rename -v "s/$old_name/$new_name/" ../thumbnails/$db/Named_Snaps/*
        rename -v "s/$old_name/$new_name/" ../thumbnails/$db/Named_Titles/*
    done < <(tail -n +1 "$db.csv")
}

rename_test
rename_real_do

# read -p "Do you wish to install this program?" yn
# case $yn in
# [Yy]*)
#     rename_real_do
#     break
#     ;;
# [Nn]*) exit ;;
# *) echo "Please answer yes or no." ;;
# esac
