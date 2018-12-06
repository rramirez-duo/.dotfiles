syndaemon -d -m 100 -t -k -i 2.0
export BROWSER=google-chrome &

# customize keymappings
killall xbindkeys
xbindkeys -f ~/.xbindkeysrc

# config trackpad
$HOME/bin/configure-trackpad-palm-detection.sh
# configure scroll speed
killall imwheel

# faster key repeat
xset r rate 250 60

# config logitech trackpad
$HOME/bin/logitech-t650-config.sh

# display config
sh $HOME/bin/init-display.sh

# auto-detect monitor setup
srandrd rescreen && nitrogen --restore &

# disable gnome window desktop background
gsettings set org.gnome.desktop.background show-desktop-icons false

# setup desktop background
nitrogen /home/rramirez/.dotfiles/desktop-background/minimalism_breaking_bad_walter_white_graphics_vector_93469_1600x900.jpg

# remove blues from screen when night time to help sleep at night
redshift-gtk &

# setup gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# disable optical drive eject button
bash -c 'eject -i on /dev/sr0'

# setup power saving
while true; do \
    sudo tlp start; \
    sleep 30; \
done &

# if machine is a mac
sh ~/bin/setup-mac.sh

# start network manager applet
nm-applet &

# fix gnome terminal being able to launch on XPS 15 9550
dbus-update-activation-environment --all

gsettings set org.gnome.desktop.interface scaling-factor 1
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export ELM_SCALE=1
xrdb -merge ~/.Xresources

udiskie -t &

# allow GTK apps to run even with wayland installed
#xhost +local:

# turn off the ethernet to improve battery life
sudo ip link set enp0s25 down

# turn off bluetooth to improve battery life
sh /home/rramirez/bin/bluetooth-off

# setup compose key (menu key) for alt gr special character typing
setxkbmap -option compose:menu

#exec i3 -c ~/.i3/i3status.conf
exec i3
