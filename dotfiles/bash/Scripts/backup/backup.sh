#/bin/bash

# Global Variables

# Check if Directories exist
echo " This backup is configured to work on Linux Mint"
echo " If we want to make it global we should use ROOT for LIN"
echo " and ask for partitions to be used"
echo " "
echo " Checking if Directories exist ..."
if [ ! -d "$MyLin_Bck" ]; then
    echo "WARNING Linux Bck does not exist"
fi
if [ ! -d "$MyLin2_Bck" ]; then
    echo "WARNING Linux 2 Bck does not exist"
fi
if [ ! -d "$MyHome_Bck" ]; then
    echo "WARNING Home Bck does not exist"
fi

if [ ! -d "$MyData" ]; then
    echo "WARNING MyData does not exist"
fi

if [ ! -d "$MyData_Bck" ]; then
    echo "WARNING Data Bck does not exist"
fi

if [ ! -d "$MyMuz" ]; then
    echo "WARNING Muz does not exist"
fi

if [ ! -d "$MyMuz_Bck" ]; then
    echo "WARNING Muz Bck does not exist"
fi

echo ""
echo "... Checked directories"

# Partiton
PS3="Choose (1-4):"
echo "Choose a Partition."
select partition in LIN HOME DATA MUZ VAR USR LIN2
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
          command='sudo rsync -aAXvS '"$param"' --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/home/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/cdrom/* --exclude=/lost+found / /media/pierre/LIN_Bck';;
      HOME)
        command='sudo rsync -aAXv '"$param"' --delete --exclude=/pierre/MUZ/* --exclude=/pierre/DATA/* /home/ /media/pierre/HOME_Bck';;
      DATA)
          command='sudo rsync -aAXv '"$param"' --delete --exclude=/Dls_P2P/* --exclude=/.Trash-1000/* /media/pierre/DATA/ /media/pierre/DATA_Bck/data';;
      MUZ)
          command='sudo rsync -aAXv '"$param"' --delete /media/pierre/MUZ/ /media/pierre/MUZ_Bck';;
      VAR)
          command='sudo rsync -aAXv '"$param"' --delete /var/ /media/pierre/VAR_DOCKER_Bck';;
      USR)
          command='sudo rsync -aAXv '"$param"' --delete /usr /media/pierre/USR';;
      LIN2)
          command='sudo rsync -aAXv '"$param"' --delete /media/pierre/LIN2/ /media/pierre/LIN2_Bck';;
 esac

# Execute

echo "You selected $command"

echo "Do you want to continue?(y/n)"
read input
if [ "$input" == "y" ]
then
    echo "continue"
    $command
    echo "Finished to backup $partition with the $option option"
fi

echo "Good Bye"
