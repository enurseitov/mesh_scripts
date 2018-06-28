iw wlan0 set type ibss
ip link set wlan0 up

iw wlan0 ibss join viemesh 2432 key d:2:abcdefghijklm
# replace <adhocnetworkname> with a ssid for example: rpiadhoc
# replace <password> with a password of length 5 or 13 (WEP) for example: abcdefghijklm

modprobe batman-adv
batctl if add wlan0

ip link set up dev wlan0
ip link set up dev bat0

batctl gw_mode client # optional if there is a gateway for internet in your network
