#!/bin/bash

hostname=$(hostname -f)
echo '~/bin/init-display'
echo $hostname

HOME_MONITOR=$(xrandr | egrep -i 'DP.*connected' | egrep -v 'disconnected|eDP' | wc -l)

xrandr --auto
if [[ $hostname == 'chromebook' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        echo "FOUND external display"
        sh ~/.screenlayout/home.sh
    else
        echo "no external display"
        xrandr \
            --dpi 96 \
            --output eDP1 --mode 1600x900 --rotate normal \
            --output DP1 --off \
            --output DP2 --off \
            --output HDMI2 --off \
            --output HDMI1 --off
    fi
elif [[ $hostname == 'rramirez-ThinkPad-T470' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        sh ~/.screenlayout/home.sh
    else
        echo 'setting up display for T470'
        xrandr \
            --dpi 96 \
            --output eDP-1 --mode 1920x1080 --rotate normal \
            --output HDMI-1 --off \
            --output HDMI-2 --off \
            --output DP-1 --off \
            --output DP-2 --off
    fi
elif [[ $hostname == 'XPS-15-9550' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        sh ~/.screenlayout/home.sh
    else
        echo 'setting up display for T470'
        xrandr \
            --dpi 96 \
            --output eDP-1 --mode 1920x1080 --rotate normal \
            --output HDMI-1 --off \
            --output HDMI-2 --off \
            --output DP-1 --off \
            --output DP-2 --off
    fi
elif [[ $hostname == 'home-x220' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        sh ~/.screenlayout/home.sh
    else
        echo 'setting up display for T470'
        xrandr \
            --dpi 96 \
            --output LVDS1 --mode 1366x768 --rotate normal \
            --output HDMI1 --off \
            --output HDMI2 --off \
            --output DP1 --off \
            --output DP2 --off
    fi
elif [[ $hostname == 'XPS-15-9550' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        sh ~/.screenlayout/home.sh
    else
        echo 'setting up display for XPS-15-9550'
        xrandr \
            --dpi 96 \
            --output eDP1 --mode 1920x1080 --rotate normal \
            --output HDMI1 --off \
            --output HDMI2 --off \
            --output DP1 --off \
            --output DP2 --off
    fi
elif [[ $hostname == 'it-rueben-w520' ]]; then
    echo 'setting up display for newtek w520';
    xrandr --output LVDS2 --mode 1600x900
    xrandr --output DP-1-1 --above LVDS2
    xrandr --output DP-1-2 --above LVDS2
    xrandr --output DP-1-3 --above LVDS2
elif [[ $hostname == 'ThinkPad-W520' ]]; then
    echo 'setting up display for personal w520'
    xrandr --output LVDS-0 --mode 1600x900
    xrandr --output DisplayPort-0 --above LVDS-0
    xrandr --output DisplayPort-2 --above LVDS-0
    xrandr --output LVDS1 --mode 1920x1080
    xrandr --output DP-1-2 --above LVDS1
    xrandr --output DP-1-2 --above LVDS2
    xrandr --output DP-1-3 --above LVDS1
    xrandr --output DP-1-3 --above LVDS2
elif [[ $hostname == 'le-laptop' ]]; then
    if [[ $HOME_MONITOR == 1 ]]; then
        echo "T420 external monitor found"
        sh ~/.screenlayout/home.sh
    else
        echo 'setting up display for personal T420'
        xrandr --output LVDS-1 --mode 1600x900
        xrandr --output DP-1 --above LVDS-1
        xrandr --output DP-2 --above LVDS-1
        xrandr --output DP-3 --above LVDS-1
        xrandr --output HDMI-1 --above LVDS-1
        xrandr --output HDMI-2 --above LVDS-1
        xrandr --output VGA-1 --above LVDS-1
    fi
elif [[ $hostname == "frankenmac" ]]; then
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
