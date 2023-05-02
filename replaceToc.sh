#!/usr/bin/env bash

if [ -z "${retail}" ]; then
  retail=100100
fi
if [ -z "${wrath}" ]; then
  wrath=30401
fi
if [ -z "${bcc}" ]; then
  bcc=20504
fi
if [ -z "${classic}" ]; then
  classic=11403
fi


if [ $# -eq 0 ]; then
  find . \( ! -regex '.*/\..*' \) -type f -name "*.toc" -exec sed -i \
    "s/@toc-version-retail@/$retail/g; s/@toc-version-wrath@/$wrath/g; s/@toc-version-bc@/$bcc/g; s/@toc-version-bcc@/$bcc/g; s/@toc-version-classic@/$classic/g" \
    {} +
fi

for var in "$@"
do
  sed -i "s/@toc-version-retail@/$retail/g" "$var"
  sed -i "s/@toc-version-wrath@/$wrath/g" "$var"
  sed -i "s/@toc-version-bc@/$bcc/g" "$var"
  sed -i "s/@toc-version-bcc@/$bcc/g" "$var"
  sed -i "s/@toc-version-classic@/$classic/g" "$var"
done
