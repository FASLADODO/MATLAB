clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');


j=8;    
ftime=[12; 18; 24;];
for ii=1:1
%      for ij=1:numel(ftime)
     for ij=2:2
    if ftime(ij)==24
    fo = fopen([ './shscript/opr' num2str(fdate2(ii),'%08d') '_' num2str(ftime(ij)-24,'%02d') '.sh'],'w');
    else    
    fo = fopen([ './shscript/test' num2str(fdate(ii),'%08d') '_' num2str(ftime(ij),'%02d') '.sh'],'w');
    end   
    
     
    fprintf(fo,'%s\n',[ 'export PATH=/localdata2/yunsung.hwang/WDSS2/bin:$PATH' ]);
    fprintf(fo,'%s\n',[ 'export LD_LIBRARY_PATH=/localdata2/yunsung.hwang/WDSS2/lib:$LD_LIBRARY_PATH' ]);
    fprintf(fo,'%s\n',[ 'export W2_CONFIG_LOCATION=/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config:/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config' ]);
    fprintf(fo,'%s\n',[ 'export WDSSII_INSTALL_DIR=/localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava' ]);
    
 fprintf(fo,'%s\n',[ 'res1=$(date +%s.%N)' ]);
   
% if ftime(ij)==24
%     for kk=1:8                
%     fprintf(fo,'%s\n', [ 'wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.' num2str(fdate2(ii),'%08d') '/hrrr.t' num2str(ftime(ij)-24,'%02d') 'z.wrfsfcf' num2str(kk,'%02d') ...
%         '.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN']);
%     end
%  else
%     for kk=1:8                
%     fprintf(fo,'%s\n', [ 'wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.' num2str(fdate(ii),'%08d') '/hrrr.t' num2str(ftime(ij),'%02d') 'z.wrfsfcf' num2str(kk,'%02d') ...
%         '.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN']);
%      end
% end
%        fprintf(fo,'%s\n',[ 'java -Xmn100M -Xms500M -Xmx500M -jar /localdata2/yunsung.hwang/WDSS2_20141019/' ...
%            'src/wdssiijava/dist/wdssii.jar org.wdssii.ncingest.GridDatasetIngest /localdata2/yunsung.hwang/opr_HRRR/' ...
%            'test2015.xml' ]);
% 

    fprintf(fo,'%s\n','HWORK="/localdata2/yunsung.hwang/opr_HRRR"');
    fprintf(fo,'%s\n','AWORK="$HWORK/WORK"');
    
   fprintf(fo,'%s\n',['MRMS="/raid/swat_archive/merged/' num2str(fdate(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
   fprintf(fo,'%s\n',['MRMS2="/raid/swat_archive/merged/' num2str(fdate2(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
   
    fprintf(fo,'%s\n','E="MergedReflectivityQCComposite"');
    fprintf(fo,'%s\n','H="HZ"');
    fprintf(fo,'%s\n',' ');
    fprintf(fo,'%s\n',' ');
    
    for k=4:4:4*(j)
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_' num2str(15*k,'%04i')  'min -o "$HWORK/PNG_RESULT/" -P "%t_%p.png" -B' ]);   
    fprintf(fo,'%s\n',' "/localdata2/yunsung.hwang/statesp020.shp "');
    fprintf(fo,'%s\n','    ');
    end
    
       for k=4:4:4*(j)
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_' num2str(15*k,'%03i')  'min -o "$HWORK/PNG_RESULT/" -P "%t_%p.png" -B' ]);   
    fprintf(fo,'%s\n',' "/localdata2/yunsung.hwang/statesp020.shp "');
    fprintf(fo,'%s\n','    ');
       end
    
          for k=4:4:4*(j)
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I $H:' num2str(15*k,'%03i')  'Minute -o "$HWORK/PNG_RESULT/" -P "%t_%p.png" -B' ]);   
    fprintf(fo,'%s\n',' "/localdata2/yunsung.hwang/statesp020.shp "');
    fprintf(fo,'%s\n','    ');
    end

 
     fprintf(fo,'%s\n','res2=$(date +%s.%N)');
     fprintf(fo,'%s\n','dt=$(echo "$res2 - $res1" | bc)');
     fprintf(fo,'%s\n','dd=$(echo "$dt/86400" | bc)');
     fprintf(fo,'%s\n','dt2=$(echo "$dt-86400*$dd" | bc)');
     fprintf(fo,'%s\n','dh=$(echo "$dt2/3600" | bc)');
     fprintf(fo,'%s\n','dt3=$(echo "$dt2-3600*$dh" | bc)');
     fprintf(fo,'%s\n','dm=$(echo "$dt3/60" | bc)');
     fprintf(fo,'%s\n','ds=$(echo "$dt3-60*$dm" | bc)');
     fprintf(fo,'%s\n','printf "Total runtime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds');




    fclose(fo);
    end
end