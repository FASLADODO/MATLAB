export PATH=/localdata2/yunsung.hwang/WDSS2/bin:$PATH
export LD_LIBRARY_PATH=/localdata2/yunsung.hwang/WDSS2/lib:$LD_LIBRARY_PATH
export W2_CONFIG_LOCATION=/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config:/localdata2/yunsung.hwang/WDSS2_20141019/src/w2/w2config
export WDSSII_INSTALL_DIR=/localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava
res1=$(date +%s.%N)
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf01.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf02.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf03.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf04.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf05.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf06.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf07.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
wget get http://www.ftp.ncep.noaa.gov/data/nccf/nonoperational/com/hrrr/prod/hrrr.20150502/hrrr.t11z.wrfsfcf08.grib2 -P /localdata2/yunsung.hwang/opr_HRRR/DOWN
java -Xmn100M -Xms500M -Xmx500M -jar /localdata2/yunsung.hwang/WDSS2_20141019/src/wdssiijava/dist/wdssii.jar org.wdssii.ncingest.GridDatasetIngest /localdata2/yunsung.hwang/opr_HRRR/wdssiiopr.xml
HWORK="/localdata2/yunsung.hwang/opr_HRRR"
OWORK="/localdata2/yunsung.hwang"
AWORK="$HWORK/WORK"
MRMS="/raid/swat_archive/merged/20150502/multi/MergedReflectivityQCComposite/00.50"
MRMS2="/raid/swat_archive/merged/20150501/multi/MergedReflectivityQCComposite/00.50"
EMRMS="/raid/swat_archive/merged/20150502/multi/EchoTop_18/00.50"
EMRMS2="/raid/swat_archive/merged/20150501/multi/EchoTop_18/00.50"
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
cp $MRMS/20150502-1030* $HWORK/INPUT/$E/00.00/
cp $MRMS/20150502-1040* $HWORK/INPUT/$E/00.00/
cp $MRMS/20150502-1050* $HWORK/INPUT/$E/00.00/
cp $MRMS/20150502-1100* $HWORK/INPUT/$E/00.00/
cp $EMRMS/20150502-1020* $HWORK/INPUT/$ETP/00.00/
cp $EMRMS/20150502-1030* $HWORK/INPUT/$ETP/00.00/
cp $EMRMS/20150502-1040* $HWORK/INPUT/$ETP/00.00/
cp $EMRMS/20150502-1050* $HWORK/INPUT/$ETP/00.00/
cp $EMRMS/20150502-1100* $HWORK/INPUT/$ETP/00.00/
/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$E" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$H" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
makeIndex.pl $AWORK code_index2.xml
w2segmotionll -i $AWORK/code_index2.xml -O "10" -T "$E" -t " 60 120 180 240 300 360 420 480" -d "0 70" -g -o "$AWORK" 
makeIndex.pl $AWORK code_index2.xml
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 60 -t " 60" -d "0 70" -M $H:060Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 120 -t " 120" -d "0 70" -M $H:120Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 180 -t " 180" -d "0 70" -M $H:180Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 240 -t " 240" -d "0 70" -M $H:240Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 300 -t " 300" -d "0 70" -M $H:300Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 360 -t " 360" -d "0 70" -M $H:360Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 420 -t " 420" -d "0 70" -M $H:420Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2morphtrack -i $AWORK/code_index2.xml -I $E -T 480 -t " 480" -d "0 70" -M $H:480Minute -m WindField -P "none" -o $AWORK -W 480 
makeIndex.pl $AWORK code_index2.xml
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0060min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0120min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0180min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0240min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0300min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0360min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0420min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0480min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0060min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0120min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0180min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0240min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0300min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0360min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0420min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite_0480min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
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
cp $MRMS/20150502-1200* $HWORK/INPUT/$E/00.00/
cp $MRMS/20150502-1300* $HWORK/INPUT/$E/00.00/
/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$E" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
makeIndex.pl $AWORK code_index2.xml
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCComposite -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I MergedReflectivityQCCompositemin -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B  "/localdata2/yunsung.hwang/statesp020.shp "  -R    
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
mkdir $HWORK/TRANS/Z20150502-11
mv $AWORK/MergedReflectivityQCComposite* $HWORK/TRANS/Z20150502-11
rm -rf $HWORK/WORK/*
/localdata2/yunsung.hwang/WDSS2/src/w2/scripts/makeIndex.pl $HWORK/INPUT code_index.xml
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$ETP" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
w2cropconv -i $HWORK/INPUT/code_index.xml -I "$HE" -t "51.00 -127" -b "21.00 -65.00" -s "0.03 0.03" -o "$AWORK" -R  
makeIndex.pl $AWORK code_index2.xml
w2segmotionll -i $AWORK/code_index2.xml -O "10" -T "$ETP" -t " 60 120 180 240 300 360 420 480" -d "0 20" -g -o "$AWORK" 
makeIndex.pl $AWORK code_index2.xml
w2smooth -i $AWORK/code_index2.xml -t "$HEs" -o "$AWORK" -T "$HE" -k scaling:0.001:0
makeIndex.pl $AWORK code_index2.xml
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 60 -t " 60" -d "0 20" -M $HEs:060Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 120 -t " 120" -d "0 20" -M $HEs:120Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 180 -t " 180" -d "0 20" -M $HEs:180Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 240 -t " 240" -d "0 20" -M $HEs:240Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 300 -t " 300" -d "0 20" -M $HEs:300Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 360 -t " 360" -d "0 20" -M $HEs:360Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 420 -t " 420" -d "0 20" -M $HEs:420Minute -m WindField -P "none" -o $AWORK -W 480 
    
w2morphtrack -i $AWORK/code_index2.xml -I $ETP -T 480 -t " 480" -d "0 20" -M $HEs:480Minute -m WindField -P "none" -o $AWORK -W 480 
    
makeIndex.pl $AWORK code_index2.xml
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0060min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0120min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0180min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0240min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0300min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0360min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0420min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0480min -o "$HWORK/" -P "%t_%p.png" -B "/localdata2/yunsung.hwang/statesp020.shp "
    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0060min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0120min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0180min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0240min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0300min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0360min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0420min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
w2pngconvert -i $AWORK/code_index2.xml -I EchoTop_18_0480min -t "51 -127 51 -106 51 -85 43 -127 38 -110 37 -92" -b "36 -106 36 -85 36 -65 28 -106 23 -89 22 -71" -s "0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03 0.03" -o "$OWORK/opr_SUB1 $OWORK/opr_SUB2 $OWORK/opr_SUB3 $OWORK/opr_SUB4 $OWORK/opr_SUB5 $OWORK/opr_SUB6" -P "%t_%p.png" -B   "/localdata2/yunsung.hwang/statesp020.shp "  -R    
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
mkdir $HWORK/TRANS/E20150502-11
mv $AWORK/EchoTop_18* $HWORK/TRANS/E20150502-11
rm -rf $HWORK/INPUT/*
rm -rf $HWORK/DOWN/*
rm -rf $HWORK/WORK/*
