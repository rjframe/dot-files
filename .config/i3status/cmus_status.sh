#!/bin/sh

if track_info=`cmus-remote -Q 2> /dev/null`; then
    track_info=`echo "$track_info" | sort | awk '\
        /^tag artist/ { $1=$2=""; print } \
        /^tag title/  { $1=$2=""; print } \
    '`

    title="${track_info#*$'\n'}"
    artist="${track_info%$'\n'*}"

    echo "${title#'  '} - ${artist#'  '}" > "$HOME/.cache/cmus_playing.txt"
else
    echo '' > "$HOME/.cache/cmus_playing.txt"
fi

/bin/kill -s RTMIN+1 i3status-rs
