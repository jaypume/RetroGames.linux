#!/bin/bash

usage="$(basename "$0") [-h] [-c csv_file] -p filepath to batch rename 
where:
    -h  show this help text
    -c  set the csv file
    -p  set the file need to be batch renamed
"

while getopts ':hc:p:' option; do
    case "$option" in
    h)
        echo "$usage"
        exit
        ;;
    c)
        csv_file=$OPTARG
        echo csv="$OPTARG"
        ;;
    p)
        filepath=$OPTARG
        echo fil="$OPTARG"
        ;;
    :)
        printf "missing argument for -%s\n" "$OPTARG" >&2
        exit 1
        ;;
    \?)
        printf "illegal option: -%s\n" "$OPTARG" >&2
        exit 1
        ;;
    esac
done

if [ -z "$csv_file" ] && [ -z "$filepath"]; then
    echo 'No valid options were passed'$'\n'
    echo "$usage"
    exit
fi

shift $((OPTIND - 1))


batch_rename_from_csv() {
    while IFS=',' read -r old new; do
        rename -n s/"$old/$new/" '*/*/*.png'
    done < "$1"
}

batch_rename_from_csv "$csv_file" "$filepath"


