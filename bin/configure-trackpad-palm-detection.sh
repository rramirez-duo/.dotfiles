#!/bin/bash

set -e -x

# logitech mx anywhere
xinput set-prop "pointer:Logitech MX Anywhere 2" "libinput Accel Speed" .95 || true

if [[ $(hostname -f) == "XPS-15-9550" ]]; then
    # XPS 9550 touchpad
    TOUCHPAD="DLL06E4:01 06CB:7A13 Touchpad"
    xinput set-prop "${TOUCHPAD}" "libinput Natural Scrolling Enabled" 1
    xinput set-prop "${TOUCHPAD}" "libinput Click Method Enabled" 0 1
    xinput set-prop "${TOUCHPAD}" "libinput Accel Speed" .55
    xinput set-prop "${TOUCHPAD}" "libinput Tapping Enabled" 0
elif [[ $(hostname -f) == "le-laptop" ]]; then
    # Thinkpad T420
    TOUCHPAD="SynPS/2 Synaptics TouchPad"
    xinput --disable ${TOUCHPAD}
elif [[ $(hostname -f) == "tpx1" ]]; then
    set -e -x
    # Thinkpad T470
    TOUCHPAD="SynPS/2 Synaptics TouchPad"
    xinput --enable "$TOUCHPAD"
    xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1
    xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 1
    xinput set-prop "$TOUCHPAD" "libinput Click Method Enabled" 0, 1
    xinput --disable "$TOUCHPAD"

    TRACKPOINT="TPPS/2 Elan TrackPoint"
    xinput --enable "$TRACKPOINT"
    xinput --list-props "$TRACKPOINT"
    xinput set-prop "$TRACKPOINT" "libinput Accel Profile Enabled" 1, 0
    xinput --set-prop "$TRACKPOINT" "libinput Accel Speed" 0


else

    # older thinkpad trackpad config
    # source:
    # https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Using_automatic_palm_detection
    synclient PalmDetect=1
    synclient PalmMinWidth=1
    # synclient PalmMinZ=40

    # disable tap clicks
    synclient TapButton1=0
    synclient TapButton2=0
    synclient TapButton3=0

    # Natural scrolling
    synclient HorizTwoFingerScroll=1
    synclient VertScrollDelta=-85
    synclient HorizScrollDelta=-85

    # Configuring pressure settings helps improve palm detection!
    #
    # How to determine the correct pressure settings for your trackpad:
    # 1) get the event id from your trackpad input device from
    #   /proc/bus/input/devices
    # example section:
    #        I: Bus=0011 Vendor=0002 Product=0007 Version=01b1
    #        N: Name="SynPS/2 Synaptics TouchPad"
    #        P: Phys=isa0060/serio1/input0
    #        S: Sysfs=/devices/platform/i8042/serio1/input/input5
    #        U: Uniq=
    #        H: Handlers=mouse0 event5 <-------- this line here!
    #        B: PROP=9
    #        B: EV=b
    #        B: KEY=6420 30000 0 0 0
    #        2) use evtest
    # see the "event5" on the "H:" line....
    # 2) now that we have the touchpad id, we can monitor input pressure
    #   - install `evtest` package
    # 	- stream trackpad input as diagnostic output with:
    #		sudo evtest /dev/input/event5
    #		(or whatever your event # was
    # example output (your terminal is going to get flooded with a bunch of these :
    #        Event: time 1474501372.822866, -------------- SYN_REPORT ------------
    #        Event: time 1474501372.979851, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 1
    # see the value of the `(ABS_Pressure), value 1`
    # * for my T420 (with an incredibly sensitive trackpad) I wanted to discard anything under 30 (do not register these as touch events)
    # * I only wanted to count anything over 45 as a touch event

    # higher sensitivity
    synclient FingerLow=40
    synclient FingerHigh=50

    # speed up the mouse cursor
    synclient MinSpeed=1
    synclient MaxSpeed=1.55
    synclient AccelFactor=1.3
fi



# OLDER stuff

# older thinkpads configure trackpoint using:
# source: https://www.reddit.com/r/thinkpad/comments/6hv7zf/any_linux_users_able_to_adjust_trackpoint/dj3e612/
# echo 190 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity
# echo 180 | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed
# echo 100 | sudo tee /sys/devices/platform/i8042/serio1/serio2/rate
# echo 6 | sudo tee /sys/devices/platform/i8042/serio1/serio2/inertia
