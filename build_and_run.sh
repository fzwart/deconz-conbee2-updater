#!/bin/bash

# Available firmware versions can be found here http://deconz.dresden-elektronik.de/deconz-firmware/
# The first parameter of this script should be the HEX firmware version.
# Example:
#    http://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_<hex_version>.bin.GCF

function help() {
  cat <<- EOF
    Error: the first argument should be the hex deconz firmware version.
  
    Example:
      All hex versions can be found here: 
      http://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_<hex_version>.bin.GCF
EOF
}

[[ ! -f /usr/bin/docker ]] && echo "Docker binary not installed, exit" && exit 1
[[ -z $1 ]] && help && exit 1

fw_version=$1
image_name="deconz-updater:${fw_version}"
docker build --build-arg fw_version=${fw_version} -t ${image_name} .

[[ $? -eq 0 ]] && docker run -it ${image_name} -v /dev:/dev --device /sys:/sys --device /lib/modules:/lib/modules
