########################################################
#	  System-Info
########################################################  
function battery-info
        echo -e "Battery Information\n\n" && cat /sys/class/power_supply/BAT0/capacity
end
