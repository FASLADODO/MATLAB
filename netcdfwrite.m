close all, clear all, clc
yearini=1960;
yearfin=1970;
%% --------------------
nt=144;
nx=1440;
ny=720;
lon=linspace(-180,180,nx);
lat=linspace(90,-90,ny);
time=1:nt;
[mlat,mlon]=meshgrid(lat,lon);
disp('Creando file Netcdf...')
filenc=['Data.nc'];
ncid = netcdf.create(filenc,'NC_WRITE');
% Crear dimensiones
dimid_lon = netcdf.defDim(ncid,'longitude',nx);
dimid_lat = netcdf.defDim(ncid,'latitude',ny); 
dimid_time = netcdf.defDim(ncid,'time',nt); 
% Crear variables y atributos
varid_lon = netcdf.defVar(ncid,'longitude','double',dimid_lon);
netcdf.putAtt(ncid,varid_lon,'long_name','Longitude')
netcdf.putAtt(ncid,varid_lon,'units','degrees_east')
% 
varid_lat = netcdf.defVar(ncid,'latitude','double',dimid_lat);
netcdf.putAtt(ncid,varid_lat,'long_name','Latitude')
netcdf.putAtt(ncid,varid_lat,'units','degrees_north')
%
varid_time = netcdf.defVar(ncid,'time','double',dimid_time);
netcdf.putAtt(ncid,varid_time,'long_name','Time')
netcdf.putAtt(ncid,varid_time,'units','Months since 1960-01-01 00:00:00')
% 
varid_prec = netcdf.defVar(ncid,'prec','double',[dimid_lon,dimid_lat,dimid_time]);
netcdf.putAtt(ncid,varid_prec,'long_name','Variable')
netcdf.putAtt(ncid,varid_prec,'units','mm')
netcdf.putAtt(ncid,varid_prec,'missing_value',-9999)
netcdf.endDef(ncid)
% % % Agregar datos de coordenadas
netcdf.putVar(ncid,varid_lon,lon);
netcdf.putVar(ncid,varid_lat,lat);
netcdf.putVar(ncid,varid_time,time);
m=1;
for year=yearini:yearfin   
for mes=1:12    
netcdf.putVar(ncid,varid_prec,[0 0 m-1],[nx ny 1],tmp);
m=m+1;
end
end
netcdf.close(ncid) 