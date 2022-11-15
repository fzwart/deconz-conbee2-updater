# deCONZ conbee2 firmware update docker image
The default deconz image didn't work out for me because it refused to download a new firmware version. The logfile said:

deconz    | 21:58:45:844 GW firmware update not supported on x86 linux headless

Therefore I decided to build something myself based on the firmware update script provided by deCONZ.

How to use 
==========
1) see which HEX firmware version you would like to flash to the conbee2 device
   Use this URL to see all available versions:
     http://deconz.dresden-elektronik.de/deconz-firmware/

   example:
    http://deconz.dresden-elektronik.de/deconz-firmware/deCONZ_ConBeeII_<hex_version>.bin.GCF
2) run ./build_and_run.sh <hex_firmware_version>
   It will present you an interactive firmware update where you have control over which device will
   get upgraded using which firmware.
