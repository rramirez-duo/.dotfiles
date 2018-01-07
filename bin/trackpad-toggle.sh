#!/bin/bash

set +e +x


hostname=`hostname -f`
if [ $hostname = 'XPS-15-9550' ]; then
    if [[ $(xinput --list "DLL06E4:01 06CB:7A13 Touchpad" | grep -i disabled | wc -l) > 0 ]]; then
        xinput --enable "DLL06E4:01 06CB:7A13 Touchpad"
    else
        xinput --disable "DLL06E4:01 06CB:7A13 Touchpad"
    fi;
elif [ $hostname = 'rramirez-ThinkPad-T470' ]; then
    TOUCHPAD='SynPS/2 Synaptics TouchPad'
    if [[ $(xinput --list "$TOUCHPAD" | grep -i disabled | wc -l) > 0 ]]; then
        xinput --enable "$TOUCHPAD"
    else
        xinput --disable "$TOUCHPAD"
    fi;
else
    synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
fi;
