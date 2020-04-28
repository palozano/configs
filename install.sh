#!/bin/bash

# Remember to do: $ chmod +x install.sh
# to be able to install the file

# Set where to copy the files 
DESTDIR=~/.config/
# This is the folder where the script is "${0%/*}"
SOURCEDIR=*

# First back up the old files
echo "Backing up old files and folders..."

for file in $SOURCEDIR
do
  mv $DESTDIR/$file $DESTDIR/$file.bak
done

echo "Backup done!"

echo "Copying new configuration files..."

for file in $SOURCEDIR
do
  mv file $destination_folder/
done

echo "Finished copying!"
echo "Enjoy your new system!"
