check=/home/thmyris/files/recurring-email/done
i=$(date | awk '{print $2}')
echo $i
if [ $i -eq 31 ];
then
    rm /home/thmyris/files/recurring-email/done     # remove done file the next day
fi
