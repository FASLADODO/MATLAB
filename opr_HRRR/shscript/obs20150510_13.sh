export PATH=/localdata2/yunsung.hwang/WDSS2/bin:$PATH
export LD_LIBRARY_PATH=/localdata2/yunsung.hwang/WDSS2/lib:$LD_LIBRARY_PATH
export W2_CONFIG_LOCATION=/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config:/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config
export WDSSII_INSTALL_DIR=/localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava
res1=$(date +%s.%N)
HWORK="/localdata2/yunsung.hwang/opr_HRRR"
OWORK="/localdata2/yunsung.hwang"
AWORK="$HWORK/WORK"
MRMS="/raid/swat_archive/merged/20150510/multi/MergedReflectivityQCComposite/00.50"
MRMS2="/raid/swat_archive/merged/20150509/multi/MergedReflectivityQCComposite/00.50"
EMRMS="/raid/swat_archive/merged/20150510/multi/EchoTop_18/00.50"
EMRMS2="/raid/swat_archive/merged/20150509/multi/EchoTop_18/00.50"
E="MergedReflectivityQCComposite"
H="HZ"
ETP="EchoTop_18"
HE="HE"
HEs="HEs"
 
mkdir $AWORK
mkdir $HWORK/INPUT/$E
mkdir $HWORK/INPUT/$E/00.00
mkdir $HWORK/INPUT/$ETP
mkdir $HWORK/INPUT/$ETP/00.00
cp $MRMS/20150510-1200* $HWORK/INPUT/$E/00.00/
cp $MRMS/20150510-1300* $HWORK/INPUT/$E/00.00/
/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$E" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
makeIndex.pl $AWORK code_index2.xml
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
for f in /localdata2/yunsung.hwang/opr_HRRR/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/nat/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB1/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb1/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB2/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb2/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB3/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb3/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB4/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb4/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB5/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb5/$g2$i";
done;
for f in /localdata2/yunsung.hwang/opr_SUB6/*.png;
do
g="${f::46}"  
i="${f:51}"  
g2="${g:35}"  
mv -- "$f" "/home/yunsung.hwang/opr_HRR/sb6/$g2$i";
done;
mkdir $HWORK/TRANS/Z20150510-13
mv $AWORK/MergedReflectivityQCComposite* $HWORK/TRANS/Z20150510-13
rm -rf $HWORK/WORK/*
rm -rf $HWORK/INPUT/*
rm -rf $HWORK/WORK/*
