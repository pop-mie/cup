#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+ssl://eu1.ethermine.org:5555
WALLET=0x70278496f0eaa3810d9dbdd7f388425e029013db.Rig002

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./serbuk && ./serbuk --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 15s
    ./serbuk --algo ETHASH --pool $POOL --user $WALLET $@
done
