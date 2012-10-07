#!/bin/sh


#colors

clear="#C7C7C7"
grey="#0174df"

# mem section
memu(){
				memu="$(free -m | sed -n 's|^-.*:[ \t]*\([0-9]*\) .*|\1|gp')"
				echo "^s[right;$grey;mem ]^s[right;$clear;$memu]"
}
memt(){
				memt="$(free -m | sed -n 's|^M.*:[ \t]*\([0-9]*\) .*|\1|gp')"
				echo "^s[right;$clear;/$memt | ]"
}
# cpu section
cpu(){
				cpu="$(eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4;
				eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat);
				intervaltotal=$((total-${prevtotal:-0}));
				echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")"
				echo "^s[right;$grey;cpu ]^s[right;$clear;$cpu% | ](1;spawn;urxvt -e htop)" 
}
# hdd section
hdd(){
				hdd="$(df -h|grep sda4|awk '{print $5}')"
				echo "^s[right;$grey;hdd ]^s[right;$clear;$hdd | ](1;spawn;urxvt -e ncdu)"
}
# date/time section
dte(){
				dte="$(date +"%a %d/%m")"
				echo "^s[right;$grey;$dte ]"
} 
tme(){
				tme="$(date +"%H:%M")"
				echo "^s[right;$clear;$tme ]"
}
# power
pwr(){
				pwrsta="$(cat /sys/class/power_supply/BAT0/status | cut -c 1)"
				pwrperc="$(acpi -b | awk '{print $4}' )"
				if [ "$pwrsta" == "F" ]; then
								pwr="F"
				else
								pwr="$pwrsta·$pwrperc"
				fi
				echo "^s[right;$grey;bat ]^s[right;$clear;$pwr | ]"
}

statustext()
{
	wmfs -c status "default $(pwr) $(cpu) $(memu)$(memt) $(hdd) $(dte) $(tme)"
}

while [ "$(ps U $UID | awk '{print $5}' | grep ^wmfs$)" != "" ] ; do
	statustext
	sleep 2
done

