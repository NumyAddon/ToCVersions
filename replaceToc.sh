#!/usr/bin/env bash

if [ -z "${retail}" ]; then
  retail=90200
fi
if [ -z "${bcc}" ]; then
  bcc=20504
fi
if [ -z "${classic}" ]; then
  classic=11402
fi


if [ $# -eq 0 ]
 then
  sed -i "s/@toc-version-retail@/$retail/g" ./*.toc
  sed -i "s/@toc-version-bc@/$bcc/g" ./*.toc
  sed -i "s/@toc-version-bcc@/$bcc/g" ./*.toc
  sed -i "s/@toc-version-classic@/$classic/g" ./*.toc
fi

for var in "$@"
do
  sed -i "s/@toc-version-retail@/$retail/g" "$var"
  sed -i "s/@toc-version-bc@/$bcc/g" "$var"
  sed -i "s/@toc-version-bcc@/$bcc/g" "$var"
  sed -i "s/@toc-version-classic@/$classic/g" "$var"
done
