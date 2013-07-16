#!/bin/bash

#SBATCH -J gmetisHOST #Job name
#SBATCH -o gmetisHOST.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 02:00:00 # max time

MAX=5
THREADS=16

cd /work/02556/dpereira/trunk/build/default/apps/gmetis

mkdir -p Results/HOST
rm -rf Results/HOST/*

for (( step = 0; step < $MAX; step++ )); do
  echo $step: >> Results/HOST/gmetisHOST_16
  echo $step: >> Results/HOST/gmetisHOST_128
  echo $step: >> Results/HOST/gmetisHOST_1024
done

for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 16 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/HOST/gmetisHOST_16
    done
done
for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 128 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/HOST/gmetisHOST_128
    done
done
for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 1024 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/HOST/gmetisHOST_1024
    done
done

