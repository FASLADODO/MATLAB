% ncdump -h 20130515-090000.netcdf

function a = writemat(filename)

dim_id(1) = netcdf.defDim(ncid, 'Lat', 201);
dim_id(2) = netcdf.defDim(ncid, 'Lon', 201);

var_id = netcdf.defVar(ncid, ' HRRR_EchoTop_18', 'float',  dim_id);

netcdf.endDef(ncid);

netcdf.putVar(ncid, var_id, data