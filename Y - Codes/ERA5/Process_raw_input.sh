#!/bin/bash

. /opt/.profiles/cdo.bash

# Convert files to netcdf format
cdo -f nc setgridtype,regular 'All_1980s.grib' 'All_1980s.nc' 
cdo -f nc setgridtype,regular 'All_1990s.grib' 'All_1990s.nc'
cdo -f nc setgridtype,regular 'All_2000s.grib' 'All_2000s.nc'
cdo -f nc setgridtype,regular 'All_2010s.grib' 'All_2010s.nc'

# Change variable names to identifiable ones
cdo chname,var167,Tair,var39,Qsoil1,var40,Qsoil2,var41,Qsoil3,var42,Qsoil4 'All_1980s.nc' 'All_1980s_renamed.nc'
cdo chname,var167,Tair,var39,Qsoil1,var40,Qsoil2,var41,Qsoil3,var42,Qsoil4 'All_1990s.nc' 'All_1990s_renamed.nc'
cdo chname,var167,Tair,var39,Qsoil1,var40,Qsoil2,var41,Qsoil3,var42,Qsoil4 'All_2000s.nc' 'All_2000s_renamed.nc'
cdo chname,var167,Tair,var39,Qsoil1,var40,Qsoil2,var41,Qsoil3,var42,Qsoil4 'All_2010s.nc' 'All_2010s_renamed.nc'

# Merge the files over time
cdo -r mergetime `ls *'_renamed.nc'` 'All_variables_1980_2016.nc'

# Cleanup
rm *renamed.nc