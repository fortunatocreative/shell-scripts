#!/bin/bash
#
echo "Executing script $0"
for USER in $@
do
    echo "Acchiving user: $USER"
    # Lock account
    passwd -l $USER
   # create archive of home directory. /archive of the home directory.
   tar cf /archives/${USER}.tar.gz /home/${USER}
done
