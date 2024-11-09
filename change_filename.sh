#!/bin/bash

PICS=$(ls *jpg)
DATE=$(date +%F)

for PIC in PICS
do
    echo "Rename ${PIC} to ${DATE}-${PIC}"
    mv ${PIC} ${DATE}-${PIC}
done
