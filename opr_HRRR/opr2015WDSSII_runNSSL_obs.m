clear all;
close all;
[fdate] = textread('listdate1.dat', '%d \n');
[fdate2] = textread('listdate2.dat', '%d \n');
[fdatem] = textread('listdatem1.dat', '%d \n');
j=8;
for ii=8:24
    for ij=1:24
    fo = fopen([ './shscript/obs' num2str(fdate(ii),'%08d') '_' num2str(ij-1,'%02d') '.sh'],'w');

    fprintf(fo,'%s\n',[ 'export PATH=/localdata2/yunsung.hwang/WDSS2/bin:$PATH' ]);
    fprintf(fo,'%s\n',[ 'export LD_LIBRARY_PATH=/localdata2/yunsung.hwang/WDSS2/lib:$LD_LIBRARY_PATH' ]);
    fprintf(fo,'%s\n',[ 'export W2_CONFIG_LOCATION=/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config:/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config' ]);
    fprintf(fo,'%s\n',[ 'export WDSSII_INSTALL_DIR=/localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava' ]);
    fprintf(fo,'%s\n',[ 'res1=$(date +%s.%N)' ]);
    fprintf(fo,'%s\n','HWORK="/localdata2/yunsung.hwang/opr_HRRR"');
 
    fprintf(fo,'%s\n','OWORK="/localdata2/yunsung.hwang"');
    fprintf(fo,'%s\n','AWORK="$HWORK/WORK"');   
    fprintf(fo,'%s\n',['MRMS="/raid/swat_archive/merged/' num2str(fdate(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
    fprintf(fo,'%s\n',['MRMS2="/raid/swat_archive/merged/' num2str(fdatem(ii),'%08d') '/multi/MergedReflectivityQCComposite/00.50"']);    
    fprintf(fo,'%s\n',['EMRMS="/raid/swat_archive/merged/' num2str(fdate(ii),'%08d') '/multi/EchoTop_18/00.50"']);    
    fprintf(fo,'%s\n',['EMRMS2="/raid/swat_archive/merged/' num2str(fdatem(ii),'%08d') '/multi/EchoTop_18/00.50"']);    
    
    fprintf(fo,'%s\n','E="MergedReflectivityQCComposite"');
    fprintf(fo,'%s\n','H="HZ"');
    fprintf(fo,'%s\n','ETP="EchoTop_18"');
    fprintf(fo,'%s\n','HE="HE"');
    fprintf(fo,'%s\n','HEs="HEs"');
    
    fprintf(fo,'%s\n',' ');
    fprintf(fo,'%s\n',['mkdir $AWORK']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$E']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$E/00.00']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$ETP']);
    fprintf(fo,'%s\n',['mkdir $HWORK/INPUT/$ETP/00.00']);
    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    if (ij-2)<0
    fprintf(fo,'%s\n',['cp $MRMS2/' num2str(fdatem(ii),'%08d') '-' num2str(ij-2+24,'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    
    else
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ij-2,'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    fprintf(fo,'%s\n',['cp $MRMS/' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') '00* $HWORK/INPUT/$E/00.00/']);
    end
    fprintf(fo,'%s\n','/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml');
    fprintf(fo,'%s\n','w2cropconv -i $HWORK/INPUT/code_index.xml -I "$E" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  ');
    fprintf(fo,'%s\n','makeIndex.pl $AWORK code_index2.xml');
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite ' '-o "$HWORK/" -P "%t_%p.png" -B' ]);   
    fprintf(fo,'%s\n',' "/localdata2/yunsung.hwang/statesp020.shp "');
    fprintf(fo,'%s\n','    ');
    
    fprintf(fo,'%s',['w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite ' ...
        '-t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" ' ...
        '-b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" ' ...
        '-s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" ' ...
        '-o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6"' ...
        ' -P "%t_%p.png" -B ' ]);   
    fprintf(fo,'%s',' "/localdata2/yunsung.hwang/statesp020.shp "');
    fprintf(fo,'%s','  -R');   
    fprintf(fo,'%s\n','    ');
    
    fprintf(fo,'%s\n','for f in /localdata2/yunsung.hwang/opr_HRRR/*.png;');
    fprintf(fo,'%s\n','do');
    fprintf(fo,'%s\n','g="${f::46}"  ');
    fprintf(fo,'%s\n','i="${f:51}"  ');
     fprintf(fo,'%s\n','g2="${g:35}"  ');
    fprintf(fo,'%s\n','mv -- "$f" "/home/yunsung.hwang/opr_HRR/nat/$g2$i";');
    fprintf(fo,'%s\n','done;');
 
    for pp=1:6
    fprintf(fo,'%s\n',['for f in /localdata2/yunsung.hwang/opr_SUB' num2str(pp) '/*.png;']);
    fprintf(fo,'%s\n','do');
    fprintf(fo,'%s\n','g="${f::46}"  ');
    fprintf(fo,'%s\n','i="${f:51}"  ');
     fprintf(fo,'%s\n','g2="${g:35}"  ');
    fprintf(fo,'%s\n',['mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb' num2str(pp) '/$g2$i";']);
    fprintf(fo,'%s\n','done;');
    end
        
    fprintf(fo,'%s\n',['mkdir $HWORK/TRANS/Z' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d')  ]);
    fprintf(fo,'%s\n',['mv $AWORK/MergedReflectivityQCComposite* $HWORK/TRANS/Z' num2str(fdate(ii),'%08d') '-' num2str(ij-1,'%02d') ]);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %     
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
    fprintf(fo,'%s\n','rm -rf $HWORK/WORK/*');
    fprintf(fo,'%s\n','rm -rf $HWORK/INPUT/*');
    fprintf(fo,'%s\n','rm -rf $HWORK/WORK/*');

    fclose(fo);
    end
end