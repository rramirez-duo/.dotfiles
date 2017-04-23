#!/bin/bash

hostname=`hostname -f`
echo '~/bin/init-display'
echo $hostname

xrandr --auto
if [ $hostname = 'rramirez-XPS-15-9550' ]; then
    echo 'setting up display for XPS-15-9550'
    xrandr --dpi 180
	# home big screen
	xrandr \
		--output HDMI-2 --off \
		--output HDMI-1 --off \
		--output DP-1 --mode 3440x1440 --pos 0x0 --rotate normal --scale 2x2 \
		--output eDP-1 --mode 3840x2160 --pos 1336x2880 --rotate normal \
		--output DP-2 --off
elif [ $hostname = 'it-rueben-w520' ]; then
    echo 'setting up display for newtek w520';
    xrandr --output LVDS2 --mode 1600x900
    xrandr --output DP-1-1 --above LVDS2
    xrandr --output DP-1-2 --above LVDS2
    xrandr --output DP-1-3 --above LVDS2
elif [ $hostname = 'thinkpad-t420' ]; then
    echo 'setting up display for personal w520'
    xrandr --output LVDS-0 --mode 1600x900
    xrandr --output DisplayPort-0 --above LVDS-0
    xrandr --output DisplayPort-2 --above LVDS-0
    xrandr --output LVDS1 --mode 1920x1080
    xrandr --output DP-1-2 --above LVDS1
    xrandr --output DP-1-2 --above LVDS2
    xrandr --output DP-1-3 --above LVDS1
    xrandr --output DP-1-3 --above LVDS2
elif [ $hostname = 'le-laptop' ]; then
    echo 'setting up display for x220'
    xrandr --output LVDS1 --mode 1600x900
    xrandr --output DP1 --auto --above LVDS1
    xrandr --output DP2 --auto --above LVDS1
    xrandr --output HDMI1 --auto --left-of LVDS1
    xrandr --output HDMI2 --auto --left-of LVDS1
    xrandr --output VGA1 --auto --above LVDS1
elif [ $hostname = "frankenmac" ]; then
    echo 'setting up display for (12,1) macbook pro 13'
    xrandr --output eDP1 --mode 1920x1200
    xrandr --output DP1 --above eDP1 --mode 2560x1440
    xrandr --output DP1 --above eDP1 --mode 3440x1440
    xrandr --output DP2 --above eDP1 --mode 2560x1440
    xrandr --output DP2 --above eDP1 --mode 3440x1440
    xrandr --output HDMI1 --above eDP1
    xrandr --output HDMI2 --above eDP1
else
    echo 'not sure what monitor config to use';
fi
