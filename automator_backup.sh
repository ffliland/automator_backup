DRIVE=Backup_1bc21db3-57f4-4013-bdf9-7dd44cbf08c0

for f in "$@"
do
    if [ $1 = "/Volumes/${DRIVE}" ]; then

        latestbackup="$(ls -t /Volumes/${DRIVE} | grep -m 1 ".previous" | cut -c1-10)"
        today="$(date +%Y-%m-%d-%H%M%S | cut -c1-10)"

        if [ $latestbackup != $today ]; then
            Tmutil startbackup --block
        fi

        diskutil eject /Volumes/${DRIVE}

    fi
done
