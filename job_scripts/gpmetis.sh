#!/bin/bash

#SBATCH -J gmetisMIC #Job name
#SBATCH -o gmetisMIC.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 04:00:00 # max time

PART1=16
PART2=128
PART3=1024

METIS=/work/02556/dpereira/metis-5.1.0/build/Linux-x86_64/programs/gpmetis
INPUT=/work/02556/dpereira/Inputs/USA-road-d.W.txt

cd ~

mkdir -p Measurements
mkdir -p Logs

$METIS $INPUT $PART1 2> Measurements/gmetis\_$PART1 > Logs/gmetis\_$PART1
$METIS $INPUT $PART2 2> Measurements/gmetis\_$PART2 > Logs/gmetis\_$PART2
$METIS $INPUT $PART3 2> Measurements/gmetis\_$PART3 > Logs/gmetis\_$PART3

