#!/bin/bash

#SBATCH -J gmetisMIC #Job name
#SBATCH -o gmetisMIC.%j # stdout; %j expands to jobid
#SBATCH -p development # queue
#SBATCH -N 1 # Number of nodes, not cores (16 cores/node)
#SBATCH -n 1 # Total number of tasks (if omitted, n=N)
#SBATCH -t 02:00:00 # max time

MAX=5
THREADS=244
NEXT=61

export MIC_ENV_PREFIX=MIC

cd /work/02556/dpereira/trunk/build/default/apps/gmetis

mkdir -p Results/MIC
rm -rf Results/MIC/*

for (( step = 0; step < $MAX; step++ )); do
  echo $step: >> Results/MIC/gmetisMIC_16
  echo $step: >> Results/MIC/gmetisMIC_128
  echo $step: >> Results/MIC/gmetisMIC_1024
done

for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      export MIC_OMP_NUM_THREADS=$threads
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 16 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/MIC/gmetisMIC_16
    done
done

for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      export MIC_OMP_NUM_THREADS=$threads
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 128 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/MIC/gmetisMIC_128
    done
done

for (( step = 0; step < $MAX; step++ )); do
    for (( threads = 1; threads <= $THREADS; threads++ )); do
      export MIC_OMP_NUM_THREADS=$threads
      value=$( { ./gmetis -t=$threads ../../../../inputs/road/USA-road-d.NY.gr 1024 1>/dev/null; } 2>&1 )
      sed -i "/^$step:/ s/$/ $value,/" Results/MIC/gmetisMIC_1024
    done
done

