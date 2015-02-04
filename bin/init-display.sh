#!/bin/bash

if [[ $(hostname -f) = "lefrank" ]]
then
    xrandr --auto
    xrandr --output DP-0 --left-of LVDS-1
    xrandr --output DP-1 --left-of LVDS-1
else
    xrandr --auto
    xrandr --output eDP1 --mode 1920x1200
    xrandr --output HDMI2 --right-of eDP1
    xrandr --output HDMI3 --above eDP1
fi
