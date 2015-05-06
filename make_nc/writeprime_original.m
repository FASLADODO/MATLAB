% WRITEPRIME  Write OU-PRIME data
%    writeprime(CUT) writes a set of NetCDF moment data files
%    using the data contained in the structure CUT. A pseudo-
%    timestamp filename will be created based on the scan time
%    information stored in the data astructure.
%
%    To write a set of files, simply do
%
%      writeprime(CUT);
%
%    Boon Leng Cheong
%    Atmospheric Radar Research Center
%    The University of Oklahoma
%
%    April 2012
%
function filename1 = writeprime(cut, verb)

if ~exist('verb', 'var'), verb = false; end

out_dir = sprintf('%s/Desktop/touched', getenv('HOME'));
if ~exist(out_dir, 'dir')
	mkdir(out_dir);
end

for icut = 1:numel(cut)
	for iprod = 1:numel(cut(icut).prod)
		if isfield(cut(icut).prod(iprod), 'filename')
			filename = regexp(cut(icut).prod(iprod).filename, '(?<=\/)[\w-.]+', 'match');
            if isempty(filename)
                filename = regexp(cut(icut).prod(iprod).filename, '[\w-.]+', 'match');
            end
			filename = sprintf('%s/%s', out_dir, filename{1});
			fprintf('%s --> %s\n', cut.prod(iprod).filename, filename);
			
			ncid_in = netcdf.open(cut(icut).prod(iprod).filename, 'NC_NOWRITE');
			
			[ndims, nvars, ngatts] = netcdf.inq(ncid_in);
			
		else
			filename = sprintf('%s-%s-%02d-%s.nc', ...
				cut.radar, datestr(cut.time,'YYYYMMDD-HHmmss'), cut(icut).icut, cut(icut).prod(iprod).type);
			fprintf('--> %s\n', filename);
		end
		
		if iprod == 1, filename1 = filename; end
		
		if exist(filename, 'file'), eval(['!rm ', filename]); end

		switch cut(icut).prod(iprod).type
			case 'Z'
				type_name = 'Corrected_Intensity';
				type_unit = 'dBZ';
			case 'V'
				type_name = 'Radial_Velocity';
				type_unit = 'MetersPerSecond';
			case 'W'
				type_name = 'Width';
				type_unit = 'MetersPerSecond';
			case 'D'
				type_name = 'Differential_Reflectivity';
				type_unit = 'dB';
			case 'P'
				type_name = 'PhiDP';
				type_unit = 'Degrees';
			case 'R'
				type_name = 'RhoHV';
				type_unit = 'Unitless';
			otherwise
				fprintf('Skipping type %s', cut(icut).prod(iprod).type);
				break;
		end
	
		% Now that we have a filename
		ncid_out = netcdf.create(filename, 'NC_NOCLOBBER');

		% Check dimension consitencies
		if exist('ncid_in', 'var')
			dim_ids = netcdf.inqDimIDs(ncid_in);
			for idim = 1:ndims
				[dim_name dim_len] = netcdf.inqDim(ncid_in, dim_ids(idim));
				if (verb), fprintf('%s (dimid:%d) = %d\n', dim_name, dim_ids(idim), dim_len); end
				if strcmp(dim_name, 'Azimuth')
					if (numel(cut(icut).az_deg) ~= dim_len)
						fprintf('WARNING: Number of azimuths is different from the original file.\n');
					end
				elseif strcmp(dim_name, 'Gate')
					if (cut(icut).prod(iprod).ngate ~= dim_len)
						fprintf('WARNING: Number of gates is different from the original file.\n');
					end
				end
			end
		end
		
		% Define dimensions
		nb = numel(cut(icut).az_deg);
		ng = cut(icut).prod(iprod).ngate;
		dim_ids(1) = netcdf.defDim(ncid_out, 'Azimuth', nb);
		dim_ids(2) = netcdf.defDim(ncid_out, 'Gate', ng);
		
		% Variables
		var_ids = zeros(1, nvars);
		if exist('ncid_in', 'var')
			for ivar = 1:nvars
				[var_name, xtype, dim_ids_in, natts] = netcdf.inqVar(ncid_in, ivar-1);
				var_id_in = netcdf.inqVarID(ncid_in, var_name);

				% Proper dimension id for each variable
				if numel(dim_ids_in) == 1
					var_ids(ivar) = netcdf.defVar(ncid_out, var_name, xtype, dim_ids(1));
				else
					% Reverse dim_ids as MATLAB's data is in gate x azimuth
					var_ids(ivar) = netcdf.defVar(ncid_out, var_name, xtype, dim_ids([2 1]));
				end

				% Copy the attributes
				for iatt = 1:natts
					att_name = netcdf.inqAttName(ncid_in, var_id_in, iatt-1);
					netcdf.copyAtt(ncid_in, var_id_in, att_name, ncid_out, var_ids(ivar));
				end
				
				% Save some variable IDs of interest
				if strcmp(var_name, 'Azimuth')
					az_var_id = var_ids(ivar);
				elseif strcmp(var_name, 'Elevation')
					el_var_id = var_ids(ivar);
				elseif strcmp(var_name, 'Beamwidth')
					bw_var_id = var_ids(ivar);
					%bw = netcdf.getVar(ncid_in, bw_var_id);
				elseif strcmp(var_name, 'GateWidth')
					gw_var_id = var_ids(ivar);
					gw = netcdf.getVar(ncid_in, gw_var_id);
				elseif strcmp(var_name, type_name)
					dat_var_id = var_ids(ivar);
				elseif ~isempty(strfind(var_name, '_LongPRT'))
					if strcmp(var_name(1:end-8), type_name)
						dat_var_id = var_ids(ivar);
					end
				end
			end
		else
			az_var_id = netcdf.defVar(ncid_out, 'Azimuth', 'float', dim_ids(1));
			netcdf.putAtt(ncid_out, az_var_id, 'Units', 'Degrees');
			
			el_var_id = netcdf.defVar(ncid_out, 'Elevation', 'float', dim_ids(1));
			netcdf.putAtt(ncid_out, el_var_id, 'Units', 'Degrees');

			%bw = repmat(median(diff(cut(icut).az_deg)), [1 naz]);
			bw_var_id = netcdf.defVar(ncid_out, 'Beamwidth', 'float', dim_ids(1));
			netcdf.putAtt(ncid_out, bw_var_id, 'Units', 'Degrees');
	
			gw = repmat(cut(icut).prod(iprod).delr_m, [1 ng]);
			gw_var_id = netcdf.defVar(ncid_out, 'GateWidth', 'float', dim_ids(1));
			netcdf.putAtt(ncid_out, gw_var_id, 'Units', 'Meters');
			
			dat_var_id = netcdf.defVar(ncid_out, type_name, 'float', dim_ids([2 1]));
			netcdf.putAtt(ncid_out, dat_var_id, 'Units', type_unit);
		end
		
		% Global attributes
		glob = netcdf.getConstant('NC_GLOBAL');
		if exist('ncid_in', 'var')
			for iglob = 1:ngatts
				att_name = netcdf.inqAttName(ncid_in, glob, iglob-1);
				if strcmp(att_name, 'ConversionPlugin')
					netcdf.putAtt(ncid_out, glob, att_name, 'WritePRIME v1.0 for MATLAB R2011a')
				else
					netcdf.copyAtt(ncid_in, glob, att_name, ncid_out, glob);
				end
			end
		else
			netcdf.putAtt(ncid_out, glob, 'TypeName', type_name);
			netcdf.putAtt(ncid_out, glob, 'DataType', 'RadialSet');
			netcdf.putAtt(ncid_out, glob, 'Latitude', cut(icut).lat);
			netcdf.putAtt(ncid_out, glob, 'Longitude', cut(icut).lon);
			netcdf.putAtt(ncid_out, glob, 'Height', cut(icut).elev_m);
			netcdf.putAtt(ncid_out, glob, 'Time', cut(icut).time*86400-datenum('1970-01-01'));
			netcdf.putAtt(ncid_out, glob, 'FractionalTime', 0);
			netcdf.putAtt(ncid_out, glob, 'NyquistVelocity-unit', 'MetersPerSecond');
			netcdf.putAtt(ncid_out, glob, 'NyquistVelocity-value', 16.05');
			netcdf.putAtt(ncid_out, glob, 'vcp-unit', 'dimensionless');
			netcdf.putAtt(ncid_out, glob, 'vcp_value', cut(icut).vcp);
			netcdf.putAtt(ncid_out, glob, 'radarName-unit', 'dimensionless');
			netcdf.putAtt(ncid_out, glob, 'radarName-value', cut(icut).radar);
			netcdf.putAtt(ncid_out, glob, 'RangeToFirstGate', 0)
			netcdf.putAtt(ncid_out, glob, 'RangeToFirstGateUnits', 'Meters');
			
			netcdf.putAtt(ncid_out, glob, 'Elevation', cut(icut).round(mean(cut(icut).el_deg)*10)*0.1);
			
			netcdf.putAtt(ncid_out, glob, 'MissingData', -99900.0);
			netcdf.putAtt(ncid_out, glob, 'RangeFolded', -99901.0);
			netcdf.putAtt(ncid_out, glob, 'ConversionPlugin', 'WritePRIME v1.0 for MATLAB R2011a')
			netcdf.putAtt(ncid_out, glob, 'ContactInformation', 'http://arrc.ou.edu/ouprime')
		end
		
		% Leave define mode
		netcdf.endDef(ncid_out);
		
		prod_data = cut(icut).prod(iprod).data;
		prod_data(~isfinite(prod_data)) = -99900;

		if exist('ncid_in', 'var')
			for ivar = 1:nvars
				[var_name, ~, dim_ids_in] = netcdf.inqVar(ncid_in, ivar-1);
				if (verb)
					if numel(dim_ids_in) == 2
						fprintf('%s (ng:%d x nb:%d)\n', var_name, ng, nb);
					else
						fprintf('%s (%d)\n', var_name, nb);
					end
				end
				if (ivar-1 == az_var_id)
					netcdf.putVar(ncid_out, az_var_id, cut(icut).az_deg);
					%disp(cut(icut).az_deg(1:4)')
				elseif (ivar-1 == el_var_id)
					netcdf.putVar(ncid_out, el_var_id, cut(icut).el_deg);
				elseif (ivar-1 == bw_var_id)
					%disp(cut(icut).bw_deg(1:4)')
					netcdf.putVar(ncid_out, bw_var_id, cut(icut).bw_deg);
				elseif (ivar-1 == gw_var_id)
					netcdf.putVar(ncid_out, gw_var_id, gw(1:nb));
				elseif (ivar-1 == dat_var_id)
					netcdf.putVar(ncid_out, dat_var_id, prod_data);
				else
					fprintf('%s\n', var_name);
					dat = netcdf.getVar(ncid_in, ivar-1);
					netcdf.putVar(ncid_out, var_ids(ivar), dat);
				end
			end
		else
			netcdf.putVar(ncid_out, az_var_id, cut(icut).az_deg);
			netcdf.putVar(ncid_out, el_var_id, cut(icut).el_deg);
			netcdf.putVar(ncid_out, bw_var_id, cut(icut).bw_deg);
			%netcdf.putVar(ncid_out, bw_var_id, bw);
			netcdf.putVar(ncid_out, gw_var_id, gw);
			netcdf.putVar(ncid_out, dat_var_id, prod_data);
		end
		
		netcdf.close(ncid_out);

		if exist('ncid_in', 'var'), netcdf.close(ncid_in); end
	end

end


