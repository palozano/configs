#!/bin/bash

# Remember to do: $ chmod +x install.sh
# to be able to install the file

# Set where to copy the files 
DESTDIR=$HOME/.config/
# This is the folder where the script is "${0%/*}"
SOURCEDIR=*

# First back up the old files
echo "Backing up old files and folders..."
# Create a copy of the config files
cp -r $DESTDIR $DESTDIR.bak
echo "Backup done!"

# Now copy the new configs
echo "Copying new configuration files..."

mkdir $DESTDIR/alacritty $DESTDIR/editor $DESTDIR/shell
for file in $SOURCEDIR
do
  cp file $DESTDIR/
done

echo "Finished copying!"
echo "Enjoy your new system!"
