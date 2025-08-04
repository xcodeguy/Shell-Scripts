my_ac_adapt=`ioreg -w0 -l | grep ExternalConnected | awk '{print $5}'`
if [ "$my_ac_adapt" == "Yes" ]
then
    echo "Power  : External"
else
    cur_power=`ioreg -w0 -l | grep CurrentCapacity | awk '{print $5}'`
    max_power=`ioreg -w0 -l | grep MaxCapacity | awk '{print $5}'`
    bat_percent=`echo "scale=2;$cur_power / $max_power" | bc`
    bat_percent=`echo "$bat_percent * 100" | bc | sed 's/.00//'`
    cyc_count=`ioreg -w0 -l | grep "Cycle Count" | awk 'BEGIN { FS = "=" } ; {print $8}' | awk 'BEGIN { FS = "}" } ; {print $1}'`
    echo "Power  : Battery ($bat_percent%)"
    #echo "Cycles : $cyc_count"
fi
