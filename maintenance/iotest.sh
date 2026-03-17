#/bin/bash

echo "Testing root filesystem"
/usr/bin/sudo /usr/bin/dd if=/dev/zero of=/iotest.dd bs=2048 count=1000000


echo "Cleaning"
/usr/bin/sudo /usr/bin/rm -f  /iotest.dd
