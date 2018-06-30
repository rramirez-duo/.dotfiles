#!/bin/bash

set -e -x

# logitech mx anywhere
xinput set-prop "pointer:Logitech MX Anywhere 2" "libinput Accel Speed" .95 || true

if [[ $(hostname -f) == "le-laptop" ]]; then
    # Thinkpad X220
    TOUCHPAD="SynPS/2 Synaptics TouchPad"
    xinput --disable ${TOUCHPAD}
elif [[ $(hostname -f) == "tpx1" ]]; then
    set -e -x
    # Thinkpad X1 Carbon 6th gen
    TOUCHPAD="SynPS/2 Synaptics TouchPad"
    xinput --enable "$TOUCHPAD"
    xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1
    xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 0
    xinput set-prop "$TOUCHPAD" "libinput Click Method Enabled" 0, 1
    xinput --disable "$TOUCHPAD"

    TRACKPOINT="TPPS/2 Elan TrackPoint"
    xinput --enable "$TRACKPOINT"
    xinput --list-props "$TRACKPOINT"
    xinput set-prop "$TRACKPOINT" "libinput Accel Profile Enabled" 1, 0
    xinput --set-prop "$TRACKPOINT" "libinput Accel Speed" -.55
fi
