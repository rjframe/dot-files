#!/bin/sh

# Only run rust-analyzer when plugged into an outlet - never on battery power.

is_on_power=$(upower -i /org/freedesktop/UPower/devices/line_power_AC \
    | grep online \
    | awk '{ print $2 }' \
);

if [ $is_on_power = 'yes' ]; then
    rust-analyzer $@
fi
