#!/usr/bin/env bash

if [ -z "${midnight}" ]; then
  midnight="120000,120001"
fi
if [ -z "${retail}" ]; then
  retail="110207,120000,120001"
fi
if [ -z "${mists}" ]; then
  mists=50503
fi
if [ -z "${cata}" ]; then
  cata=40402
fi
if [ -z "${wrath}" ]; then
  wrath=30403
fi
if [ -z "${bcc}" ]; then
  bcc=20505
fi
if [ -z "${classic}" ]; then
  classic=11508
fi


if [ $# -eq 0 ]; then
  find . \( ! -regex '.*/\..*' \) -type f -name "*.toc" -exec sed -i \
    "s/@toc-version-midnight@/$midnight/g; s/@toc-version-retail@/$retail/g; s/@toc-version-mists@/$mists/g; s/@toc-version-cata@/$cata/g; s/@toc-version-wrath@/$wrath/g; s/@toc-version-bc@/$bcc/g; s/@toc-version-bcc@/$bcc/g; s/@toc-version-vanilla@/$classic/g; s/@toc-version-classic@/$classic/g" \
    {} +
fi

for var in "$@"
do
  sed -i "s/@toc-version-midnight@/$midnight/g" "$var"
  sed -i "s/@toc-version-retail@/$retail/g" "$var"
  sed -i "s/@toc-version-mists@/$mists/g" "$var"
  sed -i "s/@toc-version-cata@/$cata/g" "$var"
  sed -i "s/@toc-version-wrath@/$wrath/g" "$var"
  sed -i "s/@toc-version-bc@/$bcc/g" "$var"
  sed -i "s/@toc-version-bcc@/$bcc/g" "$var"
  sed -i "s/@toc-version-classic@/$classic/g" "$var"
  sed -i "s/@toc-version-vanilla@/$classic/g" "$var"
done
