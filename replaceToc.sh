#!/usr/bin/env bash

if [ -z "${retail}" ]; then
  echo empty retail
  retail=$(grep -oP 'retail:\K\d+' toc-versions.txt)
fi
if [ -z "${bc}" ]; then
  echo empty bc
  bc=$(grep -oP 'bc:\K\d+' toc-versions.txt)
fi
if [ -z "${classic}" ]; then
  echo empty classic
  classic=$(grep -oP 'classic:\K\d+' toc-versions.txt)
fi


if [ $# -eq 0 ]
 then
  sed -i "s/@toc-version-retail@/$retail/g" ./*.toc
  sed -i "s/@toc-version-bc@/$bc/g" ./*.toc
  sed -i "s/@toc-version-classic@/$classic/g" ./*.toc
fi

for var in "$@"
do
  sed -i "s/@toc-version-retail@/$retail/g" "$var"
  sed -i "s/@toc-version-bc@/$bc/g" "$var"
  sed -i "s/@toc-version-classic@/$classic/g" "$var"
done
