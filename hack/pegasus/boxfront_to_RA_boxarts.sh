

PEGASUS_ROMS=../Roms

cp_pegasus_roms_boxfronts_to_ra_boxarts() {
    for platform in "$PEGASUS_ROMS"/*; do
        for game in "$platform"/media/*; do
            echo $game
        done
    done
}

cp_pegasus_roms_boxfronts_to_ra_boxarts


