#!/bin/bash
# Size in GB
SIZE=$1

re='^[0-9]+$'
if ! [[ $SIZE =~ $re ]] ; then
	echo "error: Not a number ($SIZE)" >&2; exit 1
fi

echo "New Swap size will be: $SIZE"

sudo swapoff -a

sudo fallocate -l "${SIZE}G" /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

echo "Done!"
