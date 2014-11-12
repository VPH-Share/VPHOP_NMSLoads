#!/bin/bash
#echo $1 input folder
#echo $2 output file name

echo ' '
echo '***************************************************************************************************'
echo 'Executing macro with Octave: '
echo '(MAT_ROT_ISB_GLOB-KP_ISB.m)'
echo '***************************************************************************************************'
echo ' '

octave ./MAT_ROT_ISB_GLOB-KP_ISB.m

file1=$1/MAT_ROT_ISB_GLOB.txt

if test ! -e $file1
then
  echo cannot create MAT_ROT_ISB_GLOB.txt and KP_ISB.txt
  echo exiting...
  exit 1
fi

file2=$1/KP_ISB.txt

if test ! -e $file2
then
  echo cannot create MAT_ROT_ISB_GLOB.txt and KP_ISB.txt
  echo exiting...
  exit 1
fi

echo 'Macro executed and two files created !!!'
echo '  - MAT_ROT_ISB_GLOB.txt'
echo '  - KP_ISB.txt' 
echo '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
echo ' '
echo '***************************************************************************************************'
echo Executing C++ aplication: 
echo '("calc_forces_and_coord")'
echo '***************************************************************************************************'

OC_L2data=$1/OC_extracted_data.txt
OC_L2weight=$1/OC_extracted_data-weight.txt

if test ! -e $OC_L2data
then
  echo cannot find OC_extracted_data.txt to extract OC_extracted_data-weight.txt
  echo exiting...
  exit 1
fi

OC_L2=`sed -n '2p' $OC_L2data`
weight=${OC_L2#*;}
echo $weight > $OC_L2weight


if test ! -e $OC_L2weight
then
  echo cannot find OC_extracted_data-weight.txt to execute calc_forces_and_coord
  echo exiting...
  exit 1
fi

outputFileName=$1/NMS_Forces.txt
echo outputFileName = $outputFileName
echo "./calc_forces_and_coord $outputFileName"
./calc_forces_and_coord $outputFileName

echo '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
echo '' 

