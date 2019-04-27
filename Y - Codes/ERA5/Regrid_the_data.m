clear
clc

fn              = 'All_variables_1980_2016.nc';
ncin            = netcdf.open(fn,'NC_NOWRITE');
lon_orig        = double(netcdf.getVar(ncin,0));
lat             = double(netcdf.getVar(ncin,1));
time            = double(netcdf.getVar(ncin,4));
Tair_orig(:,:,:)   = double(netcdf.getVar(ncin,8));
Qsoil1_orig(:,:,:) = double(squeeze(netcdf.getVar(ncin,5)));
Qsoil1_orig(:,:,:) = double(squeeze(netcdf.getVar(ncin,5)));
Qsoil1_orig(:,:,:) = double(squeeze(netcdf.getVar(ncin,5)));
Qsoil1_orig(:,:,:) = double(squeeze(netcdf.getVar(ncin,5)));
netcdf.close(ncin)

lon_orig(lon_orig>180)=lon_orig(lon_orig>180)-360; % Convert longitude to the -180 to 180 reference

% Re-organise by longitude
[lon,I]   = sort(lon_orig);  
Qsoil1 = Qsoil1_orig(I,:,:);  
Qsoil2 = Qsoil2_orig(I,:,:);  
Qsoil3 = Qsoil3_orig(I,:,:);  
Qsoil4 = Qsoil4_orig(I,:,:);   
Tair   = Tair_orig(I,:,:);   
 

clear Qsoil1_orig Qsoil2_orig Qsoil3_orig Qsoil4_orig Tair_orig
%%
fn = ['Qsoil1_TrainingResolution.nc'];
[lon_dim,lat_dim,tim_dim] = size(Tair);
ncout = netcdf.create(fn,'CLOBBER');
lonID = netcdf.defDim(ncout,'lon',lon_dim);
latID = netcdf.defDim(ncout,'lat',lat_dim);
timID = netcdf.defDim(ncout,'time',tim_dim);
varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
varid5  = netcdf.defVar(ncout,'Qsoil1',    'nc_float',[lonID,latID,timID]);
% Put the attributes for the lon dimension
netcdf.putAtt(ncout,varid1,'units','degrees_east');
netcdf.putAtt(ncout,varid1,'standard_name','longitude');
% Put the attributes for the lat dimension
netcdf.putAtt(ncout,varid2,'units','degrees_north');
netcdf.putAtt(ncout,varid2,'standard_name','latitude');
% Put the attributes for the Time
netcdf.putAtt(ncout,varid3,'units','hours since 2008-01-01 06:00:00');
netcdf.putAtt(ncout,varid3,'calendar','proleptic_gregorian');
netcdf.putAtt(ncout,varid3,'standard_name','time');
netcdf.endDef(ncout)
netcdf.putVar(ncout,varid1, lon)
netcdf.putVar(ncout,varid2, lat)
netcdf.putVar(ncout,varid3, time)
netcdf.putVar(ncout,varid5, Qsoil1)
netcdf.close(ncout) 

fn = ['Qsoil2_TrainingResolution.nc'];
[lon_dim,lat_dim,tim_dim] = size(Tair);
ncout = netcdf.create(fn,'CLOBBER');
lonID = netcdf.defDim(ncout,'lon',lon_dim);
latID = netcdf.defDim(ncout,'lat',lat_dim);
timID = netcdf.defDim(ncout,'time',tim_dim);
varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
varid5  = netcdf.defVar(ncout,'Qsoil2',    'nc_float',[lonID,latID,timID]);
% Put the attributes for the lon dimension
netcdf.putAtt(ncout,varid1,'units','degrees_east');
netcdf.putAtt(ncout,varid1,'standard_name','longitude');
% Put the attributes for the lat dimension
netcdf.putAtt(ncout,varid2,'units','degrees_north');
netcdf.putAtt(ncout,varid2,'standard_name','latitude');
% Put the attributes for the Time
netcdf.putAtt(ncout,varid3,'units','hours since 2008-01-01 06:00:00');
netcdf.putAtt(ncout,varid3,'calendar','proleptic_gregorian');
netcdf.putAtt(ncout,varid3,'standard_name','time');
netcdf.endDef(ncout)
netcdf.putVar(ncout,varid1, lon)
netcdf.putVar(ncout,varid2, lat)
netcdf.putVar(ncout,varid3, time)
netcdf.putVar(ncout,varid5, Qsoil2)
netcdf.close(ncout)

fn = ['Qsoil3_TrainingResolution.nc'];
[lon_dim,lat_dim,tim_dim] = size(Tair);
ncout = netcdf.create(fn,'CLOBBER');
lonID = netcdf.defDim(ncout,'lon',lon_dim);
latID = netcdf.defDim(ncout,'lat',lat_dim);
timID = netcdf.defDim(ncout,'time',tim_dim);
varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
varid5  = netcdf.defVar(ncout,'Qsoil3',    'nc_float',[lonID,latID,timID]);
% Put the attributes for the lon dimension
netcdf.putAtt(ncout,varid1,'units','degrees_east');
netcdf.putAtt(ncout,varid1,'standard_name','longitude');
% Put the attributes for the lat dimension
netcdf.putAtt(ncout,varid2,'units','degrees_north');
netcdf.putAtt(ncout,varid2,'standard_name','latitude');
% Put the attributes for the Time
netcdf.putAtt(ncout,varid3,'units','hours since 2008-01-01 06:00:00');
netcdf.putAtt(ncout,varid3,'calendar','proleptic_gregorian');
netcdf.putAtt(ncout,varid3,'standard_name','time');
netcdf.endDef(ncout)
netcdf.putVar(ncout,varid1, lon)
netcdf.putVar(ncout,varid2, lat)
netcdf.putVar(ncout,varid3, time)
netcdf.putVar(ncout,varid5, Qsoil3)
netcdf.close(ncout)

fn = ['Qsoil4_TrainingResolution.nc'];
[lon_dim,lat_dim,tim_dim] = size(Tair);
ncout = netcdf.create(fn,'CLOBBER');
lonID = netcdf.defDim(ncout,'lon',lon_dim);
latID = netcdf.defDim(ncout,'lat',lat_dim);
timID = netcdf.defDim(ncout,'time',tim_dim);
varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
varid5  = netcdf.defVar(ncout,'Qsoil4',    'nc_float',[lonID,latID,timID]);
% Put the attributes for the lon dimension
netcdf.putAtt(ncout,varid1,'units','degrees_east');
netcdf.putAtt(ncout,varid1,'standard_name','longitude');
% Put the attributes for the lat dimension
netcdf.putAtt(ncout,varid2,'units','degrees_north');
netcdf.putAtt(ncout,varid2,'standard_name','latitude');
% Put the attributes for the Time
netcdf.putAtt(ncout,varid3,'units','hours since 2008-01-01 06:00:00');
netcdf.putAtt(ncout,varid3,'calendar','proleptic_gregorian');
netcdf.putAtt(ncout,varid3,'standard_name','time');
netcdf.endDef(ncout)
netcdf.putVar(ncout,varid1, lon)
netcdf.putVar(ncout,varid2, lat)
netcdf.putVar(ncout,varid3, time)
netcdf.putVar(ncout,varid5, Qsoil4)
netcdf.close(ncout)

fn = ['Tair_TrainingResolution.nc'];
[lon_dim,lat_dim,tim_dim] = size(Tair);
ncout = netcdf.create(fn,'CLOBBER');
lonID = netcdf.defDim(ncout,'lon',lon_dim);
latID = netcdf.defDim(ncout,'lat',lat_dim);
timID = netcdf.defDim(ncout,'time',tim_dim);
varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
varid5  = netcdf.defVar(ncout,'Tair',     'nc_float',[lonID,latID,timID,ensID]);
% Put the attributes for the lon dimension
netcdf.putAtt(ncout,varid1,'units','degrees_east');
netcdf.putAtt(ncout,varid1,'standard_name','longitude');
% Put the attributes for the lat dimension
netcdf.putAtt(ncout,varid2,'units','degrees_north');
netcdf.putAtt(ncout,varid2,'standard_name','latitude');
% Put the attributes for the Time
netcdf.putAtt(ncout,varid3,'units','hours since 2008-01-01 06:00:00');
netcdf.putAtt(ncout,varid3,'calendar','proleptic_gregorian');
netcdf.putAtt(ncout,varid3,'standard_name','time');
netcdf.endDef(ncout)
netcdf.putVar(ncout,varid1, lon)
netcdf.putVar(ncout,varid2, lat)
netcdf.putVar(ncout,varid3, time)
netcdf.putVar(ncout,varid5, Tair)
netcdf.close(ncout) 