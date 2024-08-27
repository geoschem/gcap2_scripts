# gcap2_scripts

This repository contains scripts (written in NCL) to regrid various types of GEOS-Chem files from the GMAO 72-level grid to the GCAP2 grids.

Author: Lee Murray (@ltmurray)

## Installing NCL

Use Mamba (recommended) or Conda to create a Python environment for NCL.

### Using Mamba or Micromamba
```console
$ mamba env create -n ncl_env -c conda-forge ncl   # First-time installation
$ mamba activate ncl_env                           # Activate the environment
$ mamba deactivate                                 # Deactivate the environment
```

### Using Conda or Miniconda
```console
$ conda env create -n ncl_env -c conda-forge ncl   # First-time installation
$ conda activate ncl_env                           # Activate the environment
$ conda deactivate                                 # Deactivate the environment
```

## Regridding GMAO 72-level data to GCAP2 grids

1. Activate the Python environment (as described above)

2. Navigate to the one of the folders included here and get a directory listing.  You will see scripts for regridding the GMAO 72 level grid to the GCAP2 40, 74, and 102 level grids, plus a netCDF file with surface pressure data.

   ```console
   $ cd GMI
   $ ls
   make_102L.ncl  make_40L.ncl  make_74L.ncl  PS.2005-2014.nc4
   ```

3. Run the script corresponding to the desired output grid:

   ```console
   $ ncl make_102L.ncl   # Regrids to 102 vertical levels, or
   $ ncl make_74L.ncl    # Regrids to 74 vertical levels, or
   $ ncl make_40L.ncl    # Regrids to 40 vertical levels
   ```

4. Copy the regridded data files to the proper GCAP2 data folder in the `ExtData` directory structure.

5. Deactivate the Python environment (as described above).

6. In some cases, the scripts may not have added the regridded `lev` dimension.  You can then use one of the scripts in the `fixlev` folder to update the file:

   ```console
   $ cd fixlev
   $ ./fixlev_gcap2_102.sh /path/to/102/level/file
   $ ./fixlev_gcap2_74.sh  /path/to/74/level/file
   $ ./fixlev_gcap2_40.sh  /path/to/40/level/file
   ```
