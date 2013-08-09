#!/bin/bash

#SBATCH -J metis #Job name
#SBATCH -o metis.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 04:00:00 # max time

MAXSTEP=1
TBEGIN=55
TEND=102
TNEXT=1

PART1=16
PART2=128
PART3=1024

FOLDER="/work/02556/dpereira/Measurements/METIS"
INPUT="/work/02556/dpereira/Inputs/USA-road-d.W.txt"

METIS="/work/02556/dpereira/mt-metis-0.1/mt-metis"

mkdir -p $FOLDER/Measurements
mkdir -p $FOLDER/Logs

PARTITION1="export LD_LIBRARY_PATH=/work/02556/dpereira/metis-5.1.0/build/Linux-x86_64/libmetis:/opt/apps/intel/13/composer_xe_2013.3.163/compiler/lib/mic/:$LD_LIBRARY_PATH; for threads in $(seq $TBEGIN $TEND); do 
    $METIS $INPUT - $PART1 \$threads 2> $FOLDER/Measurements/gmetis\_$PART1\_\$threads > $FOLDER/Logs/gmetis\_$PART1\_\$threads;
  done;"

ssh mic0 $PARTITION1

PARTITION2="export LD_LIBRARY_PATH=/work/02556/dpereira/metis-5.1.0/build/Linux-x86_64/libmetis:/opt/apps/intel/13/composer_xe_2013.3.163/compiler/lib/mic/:$LD_LIBRARY_PATH; for threads in $(seq $TBEGIN $TEND); do 
    $METIS $INPUT - $PART2 \$threads 2> $FOLDER/Measurements/gmetis\_$PART2\_\$threads > $FOLDER/Logs/gmetis\_$PART2\_\$threads;
  done;"

ssh mic0 $PARTITION2

PARTITION3="export LD_LIBRARY_PATH=/work/02556/dpereira/metis-5.1.0/build/Linux-x86_64/libmetis:/opt/apps/intel/13/composer_xe_2013.3.163/compiler/lib/mic/:$LD_LIBRARY_PATH; for threads in $(seq $TBEGIN $TEND); do 
    $METIS $INPUT - $PART3 \$threads 2> $FOLDER/Measurements/gmetis\_$PART3\_\$threads > $FOLDER/Logs/gmetis\_$PART3\_\$threads;
  done;"

ssh mic0 $PARTITION3

