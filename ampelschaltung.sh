#!/bin/sh

saveFile="/usr/share/.ampel"

status=$(cat "$saveFile")

# modes
case "$status" in
0) screen -X -S ampelrandom quit
  sispmctl -f all;;

1) sispmctl -o all;;

2) sispmctl -f all
	sispmctl -o 1;;

3) sispmctl -f all
	sispmctl -o 2;;

4) sispmctl -f all
	sispmctl -o 3;;

5) screen -S 'ampelrandom' -d -m sh /usr/share/ampel-random.sh;;
esac

# increment status
let status=$status+1
if [ $status -gt 5 ]; then
	status=0
fi
# write new status
echo "$status" > "$saveFile"
