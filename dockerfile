FROM deconzcommunity/deconz
ARG fw_version
WORKDIR /usr/share/deCONZ/firmware
RUN curl -sO http://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_${fw_version}.bin.GCF
ENTRYPOINT ["/firmware-update.sh"]
