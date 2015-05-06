clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');


j=8;    
ftime=[12; 18; 24;];
for ii=1:numel(fdate)
%      for ij=1:numel(ftime)
     for ij=1:3
    if ftime(ij)==24
    fo = fopen([ './shscript/opr' num2str(fdate2(ii),'%08d') '_' num2str(ftime(ij)-24,'%02d') '.sh'],'w');
    else    
    fo = fopen([ './shscript/opr' num2str(fdate(ii),'%08d') '_' num2str(ftime(ij),'%02d') '.sh'],'w');
    end   
    
     
    fprintf(fo,'%s\n',[ 'export PATH=/localdata2/yunsung.hwang/WDSS2/bin:$PATH' ]);
    fprintf(fo,'%s\n',[ 'export LD_LIBRARY_PATH=/localdata2/yunsung.hwang/WDSS2/lib:$LD_LIBRARY_PATH' ]);
    fprintf(fo,'%s\n',[ 'export W2_CONFIG_LOCATION=/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config:/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config' ]);
    fprintf(fo,'%s\n',[ 'export WDSSII_INSTALL_DIR=/localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava' ]);
    
 fprintf(fo,'%s\n',[ 'res1=$(date +%s.%N)' ]);
   
if ftime(ij)==24
    for kk=1:8                
    fprintf(fo,'%s\n', [ 'wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.' num2str(fdate2(ii),'%08d') '/hrrr.t' num2str(ftime(ij)-24,'%02d') 'z.wrfsfcf' num2str(kk,'%02d') ...
        '.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN']);
    end
 else
    for kk=1:8                
    fprintf(fo,'%s\n', [ 'wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.' num2str(fdate(ii),'%08d') '/hrrr.t' num2str(ftime(ij),'%02d') 'z.wrfsfcf' num2str(kk,'%02d') ...
        '.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN']);
     end
end
       fprintf(fo,'%s\n',[ 'java -Xmn100M -Xms500M -Xmx500M -jar /localdata2/yunsung.hwang/WDSS2_20141019/' ...
           'src/wdssiijava/dist/wdssii.jar org.wdssii.ncingest.GridDatasetIngest /localdata2/yunsung.hwang/opr_HRRR/' ...
           'test2015.xml' ]);
% 

    fprintf(fo,'%s\n','HWORK="/localdata2/yunsung.hwang/opr_HRRR"');
    fprintf(fo,'%s\n','AWORK="$HWORK/WORK"');
    
   fprintf(fo,'%s\n',['MRMS="/raid/swat_archive/merged/' num2str(fdate(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
   fprintf(fo,'%s\n',['MRMS2="/raid/swat_archive/merged/' num2str(fdate2(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
   
    fprintf(fo,'%s\n','E="MergedReflectivityQCComposite"');
    fprintf(fo,'%s\n','H="HZ"');
    fprintf(fo,'%s\n',' ');
    fprintf(fo,'%s\n',' ');
    
    fprintf(fo,'%s\n',['mkdir $AWORK']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$E']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$E/00.00']);
    
%     fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ftime(ij)-1,'%02d') '30* $HWORK/INPUT/$E/00.00/']);
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ftime(ij)-1,'%02d') '4* $HWORK/INPUT/$E/00.00/']);
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ftime(ij)-1,'%02d') '5* $HWORK/INPUT/$E/00.00/']);
    if ftime(ij)==24
    fprintf(fo,'%s\n',['cp $MRMS2/' num2str(fdate2(ii),'%08d') '-' num2str(ftime(ij)-24,'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    
    else    
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ftime(ij),'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    end
    fprintf(fo,'%s\n','/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml');
    fprintf(fo,'%s\n','w2cropconv -i $HWORK/INPUT/code_index.xml -I "$E" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  ');
    fprintf(fo,'%s\n','w2cropconv -i $HWORK/INPUT/code_index.xml -I "$H" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  ');
    fprintf(fo,'%s\n','makeIndex.pl $AWORK code_index2.xml');
    
    fprintf(fo,'%s','w2segmotionll -i $AWORK/code_index2.xml -O "10" -T "$E" -t "');
    for k=4:4:4*(j)
    fprintf(fo,'% i', 15*k);   
    end
    fprintf(fo,'%s\n','" -d "0 70" -g -o "$AWORK" ');
    fprintf(fo,'%s\n','makeIndex.pl $AWORK code_index2.xml');

    for k=4:4:4*(j)
    fprintf(fo,'%s %i%s','w2morphtrack -i $AWORK/code_index2.xml -I $E -T', k*15, ' -t "');   
    fprintf(fo,'% i', 15*k);   
    fprintf(fo,'%s',['" -d "0 70" -M $H:' num2str(15*k,'%03i') 'Minute']);
    fprintf(fo,'%s\n',[' -m WindField -P "none" -o $AWORK -W ' num2str(15*32,'%03i') ' ']);
    fprintf(fo,'%s\n','makeIndex.pl $AWORK code_index2.xml');
    fprintf(fo,'%s\n','    ');
    end
    
    for k=4:4:4*(j)
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_' num2str(15*k,'%04i')  'min -o "$HWORK/PNG_RESULT/" -P "%t_%p.png" -B' ]);   
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


    
    
    
    
    
    
    
    
    fprintf(fo,'%s\n',['mv $AWORK/MergedReflectivityQCComposite* $HWORK/TRANS/']);
%     fprintf(fo,'%s\n',['mv $AWORK/MergedReflectivityQCCompositeimage* $HWORK/TRANS/']);
if ftime(ij)==24
    fprintf(fo,'%s\n',['tar -zvcf $HWORK/TAR_RESULT/' num2str(fdate2(ii),'%08d') '-' num2str(ftime(ij)-24,'%02d') '.tar.gz $HWORK/TRANS']);
else
    fprintf(fo,'%s\n',['tar -zvcf $HWORK/TAR_RESULT/' num2str(fdate(ii),'%08d') '-' num2str(ftime(ij),'%02d') '.tar.gz $HWORK/TRANS']);
end    
   fprintf(fo,'%s\n','rm -rf $HWORK/TRANS/*');
   fprintf(fo,'%s\n','rm -rf $HWORK/INPUT/*');
   fprintf(fo,'%s\n','rm -rf $HWORK/DOWN/*');
   fprintf(fo,'%s\n','rm -rf $HWORK/WORK/*');
   
   
   
%    fprintf(fo,'%s\n','rm -rf $MTPopr/$H/*');

% 
%    




    fclose(fo);
    end
end