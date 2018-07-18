#!/bin/bash

clear

# copy sources if needed
if [[ $1 && -d /root/calibro_V2.1/examples/simplest/$1 ]] 
then
	echo "!! TAG parameter detected. "
	echo "WARNING: all csvs from examples/simplest/$1 being copied to root examples/simplest/"
	cp /root/calibro_V2.1/examples/simplest/$1/*.csv /root/calibro_V2.1/examples/simplest/
fi

cd /root/calibro_V2.1/examples/simplest

# run calibro
/root/calibro_V2.1/calibrino --cal simplest --obs obs.csv --sim sims.csv --input inputs.csv --bc bc.csv

# copy results to the tag folder too
if [[ $1 && -d /root/calibro_V2.1/examples/simplest/$1 ]] 
then
	cp -r simplest_res ./$1/
fi