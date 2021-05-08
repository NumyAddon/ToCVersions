#!/usr/bin/env bash

if [ -z "${retail}" ]; then
  retail=90005
fi
if [ -z "${bc}" ]; then
  bc=20501
fi
if [ -z "${classic}" ]; then
  classic=11307
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
