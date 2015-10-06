#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    ./tigerc $line
done < "$1"
