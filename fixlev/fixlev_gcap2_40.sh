#!/bin/bash

# Add the lev dimension back into the file
ncap2 -O -h -s 'lev[lev]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40}; lev@long_name="GEOS-Chem level"; lev@units="level"; lev@positive="up";lev@axis="Z"' "${1}" "tmp.nc"
mv "tmp.nc" "${1}"

# Compress and chunk the file
./nc_chunk.pl "${1}" 1

exit 0
