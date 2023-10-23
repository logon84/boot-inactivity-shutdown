# boot-inactivity-shutdown
This script requires Xprintidle and enhanced notify-send (https://github.com/vlevit/notify-send.sh).
This script is meant to be used with "boot up on powerloss" setting on bios.

A lot of ethernet adapters that use WOL stop listening for magic packets if you remove the power of the computer and plug it again. That was a problem for me because I travel a lot: if one day the electricity was gone and back again from my place, then I wouldn't be able to wake up my computer via WOL (to use remote connection afterwards).

After activating setting "boot up on powerloss" on bios, the computer will wake up after a electricity interruption, and then this script launched at X-Server booting time will check if the mouse has moved on the first 10min (600000ms) after booting, and if it hasn't, the computer will shutdown saving electricity. This time, the computer will be OFF but with the WOL function ready to be launched. 




[![Donate](https://www.paypalobjects.com/es_ES/ES/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ER2LTNM5LZDTY)  
BTC address: 12cQuFn7yMSfDB1uKPGKLMQ7XSj1XF2sVA
