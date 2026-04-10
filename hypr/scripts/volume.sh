#!/bin/bash

case $1 in
    up)
        pamixer -i 5
        ;;
    down)
        pamixer -d 5
        ;;
    mute)
        pamixer -t
        ;;
esac

VOL=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume \
        -h int:value:$VOL \
        -t 1500 "Volume" "Muted 󰖁"
else
    notify-send -h string:x-canonical-private-synchronous:volume \
        -h int:value:$VOL \
        -t 1500 "Volume" "󰕾 $VOL%"
fi
