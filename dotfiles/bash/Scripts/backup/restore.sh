#/bin/bash

# Partiton

PS3="Choose (1-4):"
echo "Choose a Partition."
select partition in LIN HOME DATA MUZ
do
    break
done
echo "You chose $partition."

# Options

param="--dry-run"

PS3="Choose (1-2):"
echo "Choose Option."
select option in DRYRUN RUN
do
  case $option in
     DRYRUN) param="--dry-run";;
     RUN)    param="";;
  esac
  break
done
echo "You chose the following parameter: $param"

# Command
 case $partition in
      LIN)
          command='sudo rsync -aAXvS '"$param"' --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/home/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/cdrom/* --exclude=/lost+found /run/media/pierre/LIN_Bck/ /run/media/pierre/LIN';;
      HOME)
        command='sudo rsync -aAXv '"$param"' --delete --exclude=/pierre/MUZ/* --exclude=/pierre/DATA/* /run/media/pierre/HOME_Bck/ /run/media/pierre/HOME';;
      DATA)
          command='sudo rsync -aAXv '"$param"' --delete --exclude=/Dls_P2P/* --exclude=/.Trash-1000/* /run/media/pierre/DATA_Bck/data/ /run/media/pierre/DATA';;
      MUZ)
          command='sudo rsync -aAXv '"$param"' --delete --exclude=/Dls_P2P/* /run/media/pierre/MUZ_Bck/ /run/media/pierre/MUZ';;
 esac

# Execute

echo "You selected $command"

echo "Do you want to continue?(y/n)"
read input
if [ "$input" == "y" ]
then
    echo "continue"
    $command
    echo "Finished to restore $partition with the $option option"
fi

echo "Good Bye"
