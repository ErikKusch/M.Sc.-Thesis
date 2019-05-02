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
for ivar = 1:5
    if ivar==1; var = Qsoil1; VarName='Qsoil1'; end
    if ivar==2; var = Qsoil2; VarName='Qsoil2'; end
    if ivar==3; var = Qsoil3; VarName='Qsoil3'; end
    if ivar==4; var = Qsoil4; VarName='Qsoil4'; end
    if ivar==5; var = Tair;   VarName='Tair';   end
    
    fn = [Variables{ivar},'_TrainingResolution.nc'];
    [lon_dim,lat_dim,tim_dim] = size(Tair);
    ncout = netcdf.create(fn,'CLOBBER');
    lonID = netcdf.defDim(ncout,'lon',lon_dim);
    latID = netcdf.defDim(ncout,'lat',lat_dim);
    timID = netcdf.defDim(ncout,'time',tim_dim);
    varid1  = netcdf.defVar(ncout,'lon',      'nc_float',[lonID]); %#ok<*NBRAK>
    varid2  = netcdf.defVar(ncout,'lat',      'nc_float',[latID]);
    varid3  = netcdf.defVar(ncout,'time',     'nc_float',[timID]);
    varid5  = netcdf.defVar(ncout,VarName,    'nc_float',[lonID,latID,timID]);
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
    netcdf.putVar(ncout,varid5, var)
    netcdf.close(ncout)
end
