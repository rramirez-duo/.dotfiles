#!/bin/bash

set +e +x

hostname=`hostname -f`
if [ $hostname = 'tpx1' ]; then
    TOUCHPAD='SynPS/2 Synaptics TouchPad'
    if [[ $(xinput --list "$TOUCHPAD" | grep -i disabled | wc -l) > 0 ]]; then
        xinput --enable "$TOUCHPAD"
    else
        xinput --disable "$TOUCHPAD"
    fi;
else
    synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
fi;
