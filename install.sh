#!/bin/bash

cat <<EOF

    ##################
    #### Warning! ####
    ##################

This will overwrite your local profiles and replace them with links to the
files in this repository! The files to be replaced are:

EOF
ls files

echo -e "\nDo you want to continue? Yes: <Enter>, No: <CTRL+C>"
read

echo "Installing the profile files..."

for F in $(ls files);
do
    if [ -f "$HOME/.$F" ]
    then
        # Backup the old profiles
        rm -f "$HOME/.$F.bak"
        cat "$HOME/.$F" >"$HOME/.$F.bak"
        rm "$HOME/.$F"
    fi
    ln -s "$PWD/files/$F" "$HOME/.$F"
done

echo "Done."
